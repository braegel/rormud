require 'test_helper'

class RoomTest < ActiveSupport::TestCase
  test "room attributes must not be empty" do
  room = Room.new
  assert room.invalid?
  assert room.errors[:name].any?
  assert room.errors[:description].any?
  end
end
