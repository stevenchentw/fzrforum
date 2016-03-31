class AddDescriptionToEvents < ActiveRecord::Migration
  def change
    add_column :events, :description, :integer
  end
end
