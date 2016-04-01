class Event < ActiveRecord::Base
  validates_presence_of :topic

  belongs_to :category

  belongs_to :user

  has_many :comments
end
