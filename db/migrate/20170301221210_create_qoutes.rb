class CreateQoutes < ActiveRecord::Migration
  def change
    create_table :qoutes do |t|
      t.string :quote
      t.string :author

      t.timestamps null: false
    end
  end
end
