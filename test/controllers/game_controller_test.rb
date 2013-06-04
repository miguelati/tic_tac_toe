require 'test_helper'

class GameControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get game" do
    get :game
    assert_response :success
  end

  test "should get end" do
    get :end
    assert_response :success
  end

  test "should get process" do
    get :process
    assert_response :success
  end

end
