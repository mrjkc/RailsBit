class CreateLikes < ActiveRecord::Migration
  def change
    create_table :likes do |t|
      
      t.boolean :likes
      t.integer :article_id, :video_id, :user_id
      t.timestamps
    end
  end
end
