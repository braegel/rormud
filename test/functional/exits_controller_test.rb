require 'test_helper'

class ExitsControllerTest < ActionController::TestCase
  setup do
    session[:user_id]=users(:dave).id
    @exit = exits(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:exits)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create exit" do
    assert_difference('Exit.count') do
      post :create, exit: @exit.attributes
    end

    assert_redirected_to exit_path(assigns(:exit))
  end
  
  test "should show exit" do
    get :show, id: @exit.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @exit.to_param
    assert_response :success
  end

  test "should destroy exit" do
    assert_difference('Exit.count', -1) do
      delete :destroy, id: @exit.to_param
    end

    assert_redirected_to exits_path
  end
  
end
