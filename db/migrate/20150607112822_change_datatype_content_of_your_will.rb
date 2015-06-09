class ChangeDatatypeContentOfYourWill < ActiveRecord::Migration
  def up
    change_column :your_wills, :content, :text
  end
  def down
    change_column :your_wills, :content, :string
  end
end
