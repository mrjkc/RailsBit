class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      
      t.string :comment
      t.integer :article_id, :video_id, :user_id
      t.timestamps
    end
  end
end
