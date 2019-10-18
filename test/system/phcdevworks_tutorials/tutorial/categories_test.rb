require "application_system_test_case"

module PhcdevworksTutorials
  class Tutorial::CategoriesTest < ApplicationSystemTestCase
    setup do
      @tutorial_category = phcdevworks_tutorials_tutorial_categories(:one)
    end

    test "visiting the index" do
      visit tutorial_categories_url
      assert_selector "h1", text: "Tutorial/Categories"
    end

    test "creating a Category" do
      visit tutorial_categories_url
      click_on "New Tutorial/Category"

      fill_in "Tutorial category name", with: @tutorial_category.tutorial_category_name
      click_on "Create Category"

      assert_text "Category was successfully created"
      click_on "Back"
    end

    test "updating a Category" do
      visit tutorial_categories_url
      click_on "Edit", match: :first

      fill_in "Tutorial category name", with: @tutorial_category.tutorial_category_name
      click_on "Update Category"

      assert_text "Category was successfully updated"
      click_on "Back"
    end

    test "destroying a Category" do
      visit tutorial_categories_url
      page.accept_confirm do
        click_on "Destroy", match: :first
      end

      assert_text "Category was successfully destroyed"
    end
  end
end
