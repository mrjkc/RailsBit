class AddUsercreateToUsers < ActiveRecord::Migration
  def change
    add_column :users, :usercreate, :boolean
  end
end
