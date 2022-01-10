require 'application_system_test_case'

class ItemsTest < ApplicationSystemTestCase
  setup do
    @list = lists(:one)
    @item = items(:one)
  end

  test 'visiting the index' do
    visit list_items_url(@list)
    assert_selector 'h1', text: 'Items'
  end

  test 'creating a Item' do
    visit list_items_url(@list)
    click_on 'New Item'

    check 'Purchased' if @item.purchased
    fill_in 'Title', with: @item.title
    fill_in 'Url', with: @item.url
    click_on 'Create Item'

    assert_text 'Item was successfully created'
    assert_selector 'h1', text: 'Items'
  end

  test 'updating a Item' do
    visit list_items_url(@list)
    click_on 'Edit', match: :first

    check 'Purchased' if @item.purchased
    fill_in 'Title', with: @item.title
    fill_in 'Url', with: @item.url
    click_on 'Update Item'

    assert_text 'Item was successfully updated'
    assert_selector 'h1', text: 'Items'
  end

  test 'destroying a Item' do
    visit list_items_url(@list)
    page.accept_confirm do
      click_on 'Destroy', match: :first
    end

    assert_text 'Item was successfully destroyed'
    assert_selector 'h1', text: 'Items'
  end
end
