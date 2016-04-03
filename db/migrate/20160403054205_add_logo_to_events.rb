 class AddLogoToEvents < ActiveRecord::Migration
  def change

    add_attachment :events, :logo
    remove_column :users, :logo_file_name
    remove_column :users, :logo_content_type
    remove_column :users, :logo_file_size
    remove_column :users, :logo_updated_at

  end
end
