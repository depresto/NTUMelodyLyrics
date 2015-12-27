require 'test_helper'

class AdminControllerTest < ActionController::TestCase
  test "should get adduser" do
    get :adduser
    assert_response :success
  end

end
