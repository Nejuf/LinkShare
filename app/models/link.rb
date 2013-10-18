class Link < ActiveRecord::Base
  attr_accessible :title, :body, :user_id, :url
  validates :title, :url, :user_id, presence: true
  belongs_to :user
  has_many :link_subs
  has_many :subs, :through => :link_subs, :source => :sub
  has_many :comments

  def comments_by_parent_id
    hash = Hash.new([])
    comments.each do |parent|
      comments.each do |child|
        hash[parent] += [child] if parent.id == child.parent_comment_id
      end
    end
    hash
  end

end
