class Sub < ActiveRecord::Base
  attr_accessible :name, :mod_id

  validates :name, :mod_id, :presence => true
  validates :name, :uniqueness => true

  has_many :link_subs
  belongs_to :user, :foreign_key => :mod_id
  has_many :links, :through => :link_subs, :source => :link

end
