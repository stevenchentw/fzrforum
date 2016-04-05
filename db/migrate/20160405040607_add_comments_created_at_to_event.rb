class AddCommentsCreatedAtToEvent < ActiveRecord::Migration
  def change

    add_column :events, :comments_created_at, :datetime
  end
end

