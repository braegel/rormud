class CreateExits < ActiveRecord::Migration
  def change
    create_table :exits do |t|
      t.integer :room_from
      t.integer :room_to
      t.string :name

      t.timestamps
    end
  end
end
