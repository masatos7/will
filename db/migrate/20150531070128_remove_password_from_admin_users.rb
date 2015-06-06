class RemovePasswordFromAdminUsers < ActiveRecord::Migration
  def up
  	remove_column "admin_users", "password"
  end
  def down
  	remove_column "admin_users", "password", :string , :limit => 40
  end
end
