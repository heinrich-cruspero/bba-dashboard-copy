require 'test_helper'

class DashboardsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    @user = users(:one)
    sign_in users(:one)
  end

  test "should get index" do
    get root_url
    assert_response :success
  end
end
