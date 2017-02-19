class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.string :title
      t.text :text
      t.boolean :liked
      t.string :author_name
      t.string :image_link

      t.timestamps null: false
    end
  end
end
