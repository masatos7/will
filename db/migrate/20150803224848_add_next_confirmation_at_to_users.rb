class AddNextConfirmationAtToUsers < ActiveRecord::Migration
  def change
  	add_column "users", "next_confirmation_at", :datetime
  end
end
