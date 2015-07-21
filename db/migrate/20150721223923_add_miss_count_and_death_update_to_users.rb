class AddMissCountAndDeathUpdateToUsers < ActiveRecord::Migration
  def change
  	add_column "users", "death_update_at", :datetime
   	add_column "users", "miss_count", :integer
  end
end
