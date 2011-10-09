require 'test_helper'

class SessionsControllerTest < ActionController::TestCase
  test "should get new" do
    get :new
    assert_response :success
  end
  
  test "should login" do
    dave = users(:dave)
    post :create, :name => dave.username, :password => 'secret'
    assert_redirected_to room_path(Room.where(:name => 'Ein langer dunkler Flur').first.id)
    assert_equal dave.id, session[:user_id]
  end
  
  test "should fail login" do
    dave = users(:one)
    post :create, :name => dave.username, :password => 'wrong'
    assert_redirected_to login_url
  end
  
  test "should logout" do
    delete :destroy
    assert_redirected_to login_path
  end
  
end
