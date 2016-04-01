class Event < ActiveRecord::Base
  validates_presence_of :topic

  belongs_to :category

  belongs_to :user

  has_many :comments

  delegate :name, :to => :category, :prefix => true, :allow_nil => true
end
