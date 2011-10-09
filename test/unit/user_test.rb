require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "user attributes must not be empty" do
  user = User.new
  assert user.invalid?
  assert user.errors[:username].any?
  assert user.errors[:hashed_password].any?
  assert user.errors[:salt].any?
  end
end
