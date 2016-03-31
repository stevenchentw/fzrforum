class Event < ActiveRecord::Base
  validates_presence_of :topic
  belongs_to :category

  has_many :comments
end
