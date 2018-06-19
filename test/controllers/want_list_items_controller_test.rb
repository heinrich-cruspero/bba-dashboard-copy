# frozen_string_literal: true

require 'test_helper'

class WantListItemsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    @want_list_item = want_list_items(:one)
    sign_in users(:one)
  end

  test 'should get edit' do
    get edit_want_list_item_url(@want_list_item)
    assert_response :success
  end

  test 'should update want_list_item' do
    patch want_list_item_url(@want_list_item), params: { want_list_item: { ean: @want_list_item.ean,
                                                                           quantity: @want_list_item.quantity,
                                                                           quantity_purchased: @want_list_item.quantity_purchased,
                                                                           max_price: @want_list_item.max_price,
                                                                           want_list_id: @want_list_item.want_list_id } }
    assert_redirected_to items_want_list_url(@want_list_item.want_list)
  end

  test 'should destroy want_list_item' do
    assert_difference('WantListItem.count', -1) do
      delete want_list_item_url(@want_list_item)
    end

    assert_redirected_to items_want_list_url(@want_list_item.want_list)
  end
end
