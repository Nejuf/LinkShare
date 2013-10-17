class User < ActiveRecord::Base
  attr_accessible :username, :password
  attr_reader :password

  before_validation :ensure_session_token
  validates :username, :password_digest, :session_token, presence: true
  validates :password, length: {minimum: 6, allow_nil: true}

  has_many :links

  def password=(pass)
    unless pass.nil?
      self.password_digest = BCrypt::Password.create(pass)
    end
    @password = pass
  end

  def is_password?(pass)
    BCrypt::Password.new(self.password_digest).is_password?(pass)
  end

  def reset_session_token!
    self.session_token = SecureRandom::urlsafe_base64(16)
    self.save
  end

  def self.find_by_credentials(name, pass)
    user = User.find_by_username(name)

    if user && user.is_password?(pass)
      return user
    end
    nil
  end

  private
  def ensure_session_token
    self.session_token ||= SecureRandom::urlsafe_base64(16)
  end
end
