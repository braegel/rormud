require 'test_helper'

class ExitTest < ActiveSupport::TestCase
  test "exit attributes must not be empty" do
  exit = Exit.new
  assert exit.invalid?
  assert exit.errors[:name].any?
  assert exit.errors[:to_room].any?
  end
end
