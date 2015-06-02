class CreateYourWills < ActiveRecord::Migration
  def up
    create_table :your_wills do |t|
      t.integer "user_id"
      t.string "content"
      t.string "email", :default => "", :null => false
      t.timestamps null: false
    end
  end
  def down
  	drop_table :your_wills
  end
end
