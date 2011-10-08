class RenameColumnFromRoomInExits < ActiveRecord::Migration
  def up
    rename_column :exits, :room_from, :room
    rename_column :exits, :room_to, :to_room
  end

  def down
    rename_column :exits, :room, :room_from
    rename_column :exits, :to_room, :room_to
  end
end
