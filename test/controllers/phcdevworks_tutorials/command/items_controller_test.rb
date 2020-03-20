require 'test_helper'

module PhcdevworksTutorials
  class Command::ItemsControllerTest < ActionDispatch::IntegrationTest
    include Engine.routes.url_helpers

    setup do
      @command_item = phcdevworks_tutorials_command_items(:one)
    end

    test "should get index" do
      get command_items_url
      assert_response :success
    end

    test "should get new" do
      get new_command_item_url
      assert_response :success
    end

    test "should create command_item" do
      assert_difference('Command::Item.count') do
        post command_items_url, params: { command_item: { item_copy_command: @command_item.item_copy_command, item_description: @command_item.item_description, item_name: @command_item.item_name } }
      end

      assert_redirected_to command_item_url(Command::Item.last)
    end

    test "should show command_item" do
      get command_item_url(@command_item)
      assert_response :success
    end

    test "should get edit" do
      get edit_command_item_url(@command_item)
      assert_response :success
    end

    test "should update command_item" do
      patch command_item_url(@command_item), params: { command_item: { item_copy_command: @command_item.item_copy_command, item_description: @command_item.item_description, item_name: @command_item.item_name } }
      assert_redirected_to command_item_url(@command_item)
    end

    test "should destroy command_item" do
      assert_difference('Command::Item.count', -1) do
        delete command_item_url(@command_item)
      end

      assert_redirected_to command_items_url
    end
  end
end
