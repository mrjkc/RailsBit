class CreateForums < ActiveRecord::Migration
  def change
    create_table :forums do |t|
      
      t.string :created_by
      t.string :title
      t.string :category
      t.string :comments
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
