class RenameColumnRoomIdInExits < ActiveRecord::Migration
  def up
    rename_column :exits, :room, :room_id
  end

  def down
    rename_column :exits, :room_id, :room
  end
end
