class AddUserPassworddigest < ActiveRecord::Migration
  def up
  	add_column "users", "password_digest", :string
   	remove_column "users", "password"
  end

  def down
   	add_column "users", "password", :string , :limit => 40
  	remove_column "users", "password_digest"
  end 
end
