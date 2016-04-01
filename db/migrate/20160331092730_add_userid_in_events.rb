class AddUseridInEvents < ActiveRecord::Migration
  def change

    add_index :events, :user_id
    add_index :comments, :user_id
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string

  end
end
