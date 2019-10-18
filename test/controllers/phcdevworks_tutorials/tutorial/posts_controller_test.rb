require 'test_helper'

module PhcdevworksTutorials
  class Tutorial::PostsControllerTest < ActionDispatch::IntegrationTest
    include Engine.routes.url_helpers

    setup do
      @tutorial_post = phcdevworks_tutorials_tutorial_posts(:one)
    end

    test "should get index" do
      get tutorial_posts_url
      assert_response :success
    end

    test "should get new" do
      get new_tutorial_post_url
      assert_response :success
    end

    test "should create tutorial_post" do
      assert_difference('Tutorial::Post.count') do
        post tutorial_posts_url, params: { tutorial_post: { tutorial_post_description: @tutorial_post.tutorial_post_description, tutorial_post_image: @tutorial_post.tutorial_post_image, tutorial_post_status: @tutorial_post.tutorial_post_status, tutorial_post_title: @tutorial_post.tutorial_post_title } }
      end

      assert_redirected_to tutorial_post_url(Tutorial::Post.last)
    end

    test "should show tutorial_post" do
      get tutorial_post_url(@tutorial_post)
      assert_response :success
    end

    test "should get edit" do
      get edit_tutorial_post_url(@tutorial_post)
      assert_response :success
    end

    test "should update tutorial_post" do
      patch tutorial_post_url(@tutorial_post), params: { tutorial_post: { tutorial_post_description: @tutorial_post.tutorial_post_description, tutorial_post_image: @tutorial_post.tutorial_post_image, tutorial_post_status: @tutorial_post.tutorial_post_status, tutorial_post_title: @tutorial_post.tutorial_post_title } }
      assert_redirected_to tutorial_post_url(@tutorial_post)
    end

    test "should destroy tutorial_post" do
      assert_difference('Tutorial::Post.count', -1) do
        delete tutorial_post_url(@tutorial_post)
      end

      assert_redirected_to tutorial_posts_url
    end
  end
end
