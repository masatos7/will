class CreateComments < ActiveRecord::Migration
  def up
    create_table :comments do |t|
      t.integer "user_id"
      t.string "email", :default => "", :null => false
      t.string "comment"
      t.timestamps
    end
  end
  def down
    drop_table :comments
  end
end
