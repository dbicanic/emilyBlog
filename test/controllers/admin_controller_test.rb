require 'test_helper'

class AdminControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get createAdmin_path
    assert_response :success
  end

end
