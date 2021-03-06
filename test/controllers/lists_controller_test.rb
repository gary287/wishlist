require 'test_helper'
require 'securerandom'

class ListsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @list = lists(:one)
    @list.shared_id = SecureRandom.uuid
  end

  test 'should get index' do
    assert_raise ActionController::RoutingError do
      get lists_url
    end
  end

  test 'should get new' do
    get new_list_url
    assert_response :success
  end

  test 'should create list' do
    assert_difference('List.count') do
      post lists_url, params: { list: { shared_id: @list.shared_id, title: @list.title } }
    end

    assert_redirected_to list_items_url(List.order('lists.created_at DESC').first)
  end

  test 'should not show list' do
    assert_raise ActionController::RoutingError do
      get list_url(@list)
    end
  end

  test 'should get edit' do
    get edit_list_url(@list)
    assert_response :success
  end

  test 'should update list' do
    patch list_url(@list), params: { list: { shared_id: @list.shared_id, title: @list.title } }
    assert_redirected_to list_items_url(@list)
  end

  test 'should destroy list' do
    assert_difference('List.count', -1) do
      delete list_url(@list)
    end

    assert_redirected_to new_list_url
  end
end
