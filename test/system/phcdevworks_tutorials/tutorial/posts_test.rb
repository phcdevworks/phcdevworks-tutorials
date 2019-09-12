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

      fill_in "Category", with: @tutorial_post.category_id
      fill_in "Tutorial post step", with: @tutorial_post.tutorial_post_step
      fill_in "Tutorial post text", with: @tutorial_post.tutorial_post_text
      click_on "Create Post"

      assert_text "Post was successfully created"
      click_on "Back"
    end

    test "updating a Post" do
      visit tutorial_posts_url
      click_on "Edit", match: :first

      fill_in "Category", with: @tutorial_post.category_id
      fill_in "Tutorial post step", with: @tutorial_post.tutorial_post_step
      fill_in "Tutorial post text", with: @tutorial_post.tutorial_post_text
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
