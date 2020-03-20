require 'test_helper'

module PhcdevworksTutorials
  class Command::PostsControllerTest < ActionDispatch::IntegrationTest
    include Engine.routes.url_helpers

    setup do
      @command_post = phcdevworks_tutorials_command_posts(:one)
    end

    test "should get index" do
      get command_posts_url
      assert_response :success
    end

    test "should get new" do
      get new_command_post_url
      assert_response :success
    end

    test "should create command_post" do
      assert_difference('Command::Post.count') do
        post command_posts_url, params: { command_post: { post_description: @command_post.post_description, post_title: @command_post.post_title } }
      end

      assert_redirected_to command_post_url(Command::Post.last)
    end

    test "should show command_post" do
      get command_post_url(@command_post)
      assert_response :success
    end

    test "should get edit" do
      get edit_command_post_url(@command_post)
      assert_response :success
    end

    test "should update command_post" do
      patch command_post_url(@command_post), params: { command_post: { post_description: @command_post.post_description, post_title: @command_post.post_title } }
      assert_redirected_to command_post_url(@command_post)
    end

    test "should destroy command_post" do
      assert_difference('Command::Post.count', -1) do
        delete command_post_url(@command_post)
      end

      assert_redirected_to command_posts_url
    end
  end
end
