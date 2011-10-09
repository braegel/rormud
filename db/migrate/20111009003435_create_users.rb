class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.text :username
      t.string :hashed_password
      t.string :salt

      t.timestamps
    end
  end
end
