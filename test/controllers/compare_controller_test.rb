require 'test_helper'

class CompareControllerTest < ActionController::TestCase
  test "should get quarterbacks" do
    get :quarterbacks
    assert_response :success
  end

  test "should get runningbacks" do
    get :runningbacks
    assert_response :success
  end

  test "should get receivers" do
    get :receivers
    assert_response :success
  end

  test "should get tightends" do
    get :tightends
    assert_response :success
  end

  test "should get kickers" do
    get :kickers
    assert_response :success
  end

  test "should get defense" do
    get :defense
    assert_response :success
  end

end
