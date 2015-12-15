require 'test_helper'

class PagesControllerTest < ActionController::TestCase
  test "should get init" do
    get :init
    assert_response :success
  end

  test "should get login" do
    get :login
    assert_response :success
  end

end
