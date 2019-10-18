require "application_system_test_case"

module PhcdevworksTutorials
  class Tutorial::PostsTest < ApplicationSystemTestCase
    setup do
      @tutorial_post = phcdevworks_tutorials_tutorial_posts(:one)
    end

    test "visiting the index" do
      visit tutorial_posts_url
      assert_selector "h1", text: "Tutorial/Posts"
    end

    test "creating a Post" do
      visit tutorial_posts_url
      click_on "New Tutorial/Post"

      fill_in "Tutorial post description", with: @tutorial_post.tutorial_post_description
      fill_in "Tutorial post image", with: @tutorial_post.tutorial_post_image
      fill_in "Tutorial post status", with: @tutorial_post.tutorial_post_status
      fill_in "Tutorial post title", with: @tutorial_post.tutorial_post_title
      click_on "Create Post"

      assert_text "Post was successfully created"
      click_on "Back"
    end

    test "updating a Post" do
      visit tutorial_posts_url
      click_on "Edit", match: :first

      fill_in "Tutorial post description", with: @tutorial_post.tutorial_post_description
      fill_in "Tutorial post image", with: @tutorial_post.tutorial_post_image
      fill_in "Tutorial post status", with: @tutorial_post.tutorial_post_status
      fill_in "Tutorial post title", with: @tutorial_post.tutorial_post_title
      click_on "Update Post"

      assert_text "Post was successfully updated"
      click_on "Back"
    end

    test "destroying a Post" do
      visit tutorial_posts_url
      page.accept_confirm do
        click_on "Destroy", match: :first
      end

      assert_text "Post was successfully destroyed"
    end
  end
end
