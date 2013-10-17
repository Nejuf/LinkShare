class Link < ActiveRecord::Base
  attr_accessible :title, :body, :user_id, :url
  validates :title, :url, :user_id, presence: true
  belongs_to :user
  has_many :link_subs
  has_many :subs, :through => :link_subs, :source => :sub

end
