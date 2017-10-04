require 'test_helper'

class WantListItemsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    @want_list_item = want_list_items(:one)
    sign_in users(:one)
  end

  test "should get index" do
    get want_list_items_url
    assert_response :success
  end

  test "should get new" do
    get new_want_list_item_url
    assert_response :success
  end

  test "should create want_list_item" do
    assert_difference('WantListItem.count') do
      post want_list_items_url, params: { want_list_item: { isbn: @want_list_item.isbn, quantity: @want_list_item.quantity, want_list_id: @want_list_item.want_list_id } }
    end

    assert_redirected_to want_list_item_url(WantListItem.last)
  end

  test "should show want_list_item" do
    get want_list_item_url(@want_list_item)
    assert_response :success
  end

  test "should get edit" do
    get edit_want_list_item_url(@want_list_item)
    assert_response :success
  end

  test "should update want_list_item" do
    patch want_list_item_url(@want_list_item), params: { want_list_item: { isbn: @want_list_item.isbn, quantity: @want_list_item.quantity, want_list_id: @want_list_item.want_list_id } }
    assert_redirected_to want_list_item_url(@want_list_item)
  end

  test "should destroy want_list_item" do
    assert_difference('WantListItem.count', -1) do
      delete want_list_item_url(@want_list_item)
    end

    assert_redirected_to want_list_items_url
  end
end
