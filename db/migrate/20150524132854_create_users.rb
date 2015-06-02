class CreateUsers < ActiveRecord::Migration
  def up
    create_table :users do |t|
      t.string "name", :limit => 25
      t.string "email", :default => "", :null => false
      t.integer "interval", :default => 90
      t.integer "count", :default => 10
      t.string "password", :limit => 40
      t.timestamps
    end
  end
  def down
  	drop_table :users
  end
end
