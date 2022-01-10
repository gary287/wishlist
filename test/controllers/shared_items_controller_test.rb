require 'test_helper'
require 'securerandom'

class SharedItemsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @list = lists(:one)
    @item = items(:one)
  end

  test 'should get index' do
    get shared_items_url(@list.shared_id)
    assert_response :success
  end

  test 'should purchase item' do
    patch purchase_shared_item_url(@list.shared_id, @item)

    assert_redirected_to shared_items_url(@list.shared_id)
  end
end
