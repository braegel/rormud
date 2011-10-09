class CreateUsers < ActiveRecord::Migration
  def up
    remove_column :user, :username
    add_column :user, :username, :string
  end
  
  def down
    remove_column :user, :username
    add_column :user, :username, :text
  end
  
end
