class AddPostsCountToEvent < ActiveRecord::Migration
  def change
    add_column :events, :comments_count, :integer, :default => 0

    Event.pluck(:id).each do |i|
      Event.reset_counters(i, :comments) # 全部重算一次
    end
  end
end
