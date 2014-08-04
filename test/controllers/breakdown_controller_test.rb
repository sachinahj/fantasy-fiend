require 'test_helper'

class BreakdownControllerTest < ActionController::TestCase
  test "should get draft" do
    get :draft
    assert_response :success
  end

  test "should get player" do
    get :player
    assert_response :success
  end

end
