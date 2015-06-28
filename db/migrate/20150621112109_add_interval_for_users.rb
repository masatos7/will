class AddIntervalForUsers < ActiveRecord::Migration
  def up
  	add_column "users", "interval", :integer
  end

  def down
  	remove_column "users", "interval"
  end 
end
