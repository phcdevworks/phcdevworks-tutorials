require "application_system_test_case"

module PhcdevworksTutorials
  class Command::ItemsTest < ApplicationSystemTestCase
    setup do
      @command_item = phcdevworks_tutorials_command_items(:one)
    end

    test "visiting the index" do
      visit command_items_url
      assert_selector "h1", text: "Command/Items"
    end

    test "creating a Item" do
      visit command_items_url
      click_on "New Command/Item"

      fill_in "Item copy command", with: @command_item.item_copy_command
      fill_in "Item description", with: @command_item.item_description
      fill_in "Item name", with: @command_item.item_name
      click_on "Create Item"

      assert_text "Item was successfully created"
      click_on "Back"
    end

    test "updating a Item" do
      visit command_items_url
      click_on "Edit", match: :first

      fill_in "Item copy command", with: @command_item.item_copy_command
      fill_in "Item description", with: @command_item.item_description
      fill_in "Item name", with: @command_item.item_name
      click_on "Update Item"

      assert_text "Item was successfully updated"
      click_on "Back"
    end

    test "destroying a Item" do
      visit command_items_url
      page.accept_confirm do
        click_on "Destroy", match: :first
      end

      assert_text "Item was successfully destroyed"
    end
  end
end
