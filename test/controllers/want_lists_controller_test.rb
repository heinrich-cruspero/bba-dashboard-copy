require 'test_helper'

class WantListsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    @want_list = want_lists(:one)
    sign_in users(:one)
  end

  test "should get index" do
    get want_lists_url
    assert_response :success
  end

  test "should get new" do
    get new_want_list_url
    assert_response :success
  end

  test "should create want_list" do
    assert_difference('WantList.count') do
      post want_lists_url, params: { want_list: { name: @want_list.name, user_id: @want_list.user_id, want_list_privacy_id: @want_list.want_list_privacy_id } }
    end

    assert_redirected_to want_list_url(WantList.last)
  end

  test "should show want_list" do
    get want_list_url(@want_list)
    assert_response :success
  end

  test "should get edit" do
    get edit_want_list_url(@want_list)
    assert_response :success
  end

  test "should update want_list" do
    patch want_list_url(@want_list), params: { want_list: { name: @want_list.name, user_id: @want_list.user_id, want_list_privacy_id: @want_list.want_list_privacy_id } }
    assert_redirected_to want_list_url(@want_list)
  end

  test "should destroy want_list" do
    assert_difference('WantList.count', -1) do
      delete want_list_url(@want_list)
    end

    assert_redirected_to want_lists_url
  end

  test "should get items" do
    get items_want_list_url(@want_list)
    assert_response :success
  end
end
