require 'test_helper'

class ItemsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @list = lists(:one)
    @item = items(:one)
  end

  test 'should get index' do
    get list_items_url(@list)
    assert_response :success
  end

  test 'should get new' do
    get new_list_item_url(@list)
    assert_response :success
  end

  test 'should create item' do
    assert_difference('Item.count') do
      post list_items_url(@list),
           params: { item: { list_id: @item.list_id, purchased: @item.purchased, title: @item.title, url: @item.url } }
    end

    assert_redirected_to list_items_url(@list)
  end

  test 'should show item' do
    get list_item_url(@list, @item)
    assert_response :success
  end

  test 'should get edit' do
    get edit_list_item_url(@list, @item)
    assert_response :success
  end

  test 'should update item' do
    patch list_item_url(@list, @item),
          params: { item: { list_id: @item.list_id, purchased: @item.purchased, title: @item.title, url: @item.url } }
    assert_redirected_to list_item_url(@list, @item)
  end

  test 'should destroy item' do
    assert_difference('Item.count', -1) do
      delete list_item_url(@list, @item)
    end

    assert_redirected_to list_items_url(@list)
  end
end
