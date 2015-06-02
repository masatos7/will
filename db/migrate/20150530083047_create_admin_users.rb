class CreateAdminUsers < ActiveRecord::Migration
  def change
    create_table :admin_users do |t|
      t.string "email", :default => "", :null => false
      t.string "password", :limit => 40
      t.timestamps
      t.timestamps null: false
    end
  end
  def down
  	drop_table :admin_users
  end
end
