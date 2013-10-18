class Comment < ActiveRecord::Base
  attr_accessible :body, :link_id, :parent_comment_id, :user_id

  validates :link_id, :body, :user_id, presence: true

  belongs_to :link
  belongs_to :user
  belongs_to :parent_comment, foreign_key: :parent_comment_id, class_name: "Comment", primary_key: :id
  has_many :children_comments, foreign_key: :parent_comment_id, class_name: "Comment", primary_key: :id
end
