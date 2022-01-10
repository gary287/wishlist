require 'application_system_test_case'

class ListsTest < ApplicationSystemTestCase
  setup do
    @list = lists(:one)
  end

  test 'creating a List' do
    visit root_path

    fill_in 'Title', with: @list.title
    click_on 'Create List'

    assert_text 'List was successfully created'
    assert_selector 'h2', text: 'Items'
  end

  test 'updating a List' do
    visit list_items_url(@list)
    click_on 'Edit List', match: :first

    fill_in 'Title', with: @list.title
    click_on 'Update List'

    assert_text 'List was successfully updated'
    assert_selector 'h2', text: 'Items'
  end

  test 'destroying a List' do
    visit list_items_url(@list)
    page.accept_confirm do
      click_on 'Destroy List', match: :first
    end

    assert_text 'List was successfully destroyed'
    assert_selector 'h2', text: 'New List'
  end
end
