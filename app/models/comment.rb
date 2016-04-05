class Comment < ActiveRecord::Base

  validates_presence_of :comment

  belongs_to :event, :counter_cache => true

  belongs_to :user

end
