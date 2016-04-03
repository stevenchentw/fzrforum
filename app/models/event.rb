class Event < ActiveRecord::Base

  validates_presence_of :topic

  belongs_to :category

  belongs_to :user

  has_many :comments



  has_many :likes
  has_many :like_users, :through => :likes, :source => :user


  delegate :name, :to => :category, :prefix => true, :allow_nil => true

  has_attached_file :logo, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :logo, content_type: /\Aimage\/.*\Z/

  def finy_like_by(user)
    user && self.likes.find_by_user_id( user.id )
  end


end
