class CreateContactUs < ActiveRecord::Migration
  def change
    create_table :contact_us do |t|

      t.string :email
      t.string :phone
      t.string :name
      t.string :message
      
      t.timestamps null: false
    end
  end
end
