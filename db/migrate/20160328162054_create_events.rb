class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :topic
      t.text :article
      t.integer :user_id
      t.integer :category_id
      t.integer :comment_id

      t.timestamps null: false
    end
  end
end
