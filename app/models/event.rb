class Event < ActiveRecord::Base

  validates_presence_of :topic

  belongs_to :category

  belongs_to :user

  has_many :comments


  has_many :likes
  has_many :like_users, :through => :likes, :source => :user


  delegate :name, :to => :category, :prefix => true, :allow_nil => true

  def finy_like_by(user)
    user && self.likes.find_by_user_id( user.id )
  end


end
