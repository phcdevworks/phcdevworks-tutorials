require 'test_helper'

module PhcdevworksTutorials
  class Tutorial::CategoriesControllerTest < ActionDispatch::IntegrationTest
    include Engine.routes.url_helpers

    setup do
      @tutorial_category = phcdevworks_tutorials_tutorial_categories(:one)
    end

    test "should get index" do
      get tutorial_categories_url
      assert_response :success
    end

    test "should get new" do
      get new_tutorial_category_url
      assert_response :success
    end

    test "should create tutorial_category" do
      assert_difference('Tutorial::Category.count') do
        post tutorial_categories_url, params: { tutorial_category: {  } }
      end

      assert_redirected_to tutorial_category_url(Tutorial::Category.last)
    end

    test "should show tutorial_category" do
      get tutorial_category_url(@tutorial_category)
      assert_response :success
    end

    test "should get edit" do
      get edit_tutorial_category_url(@tutorial_category)
      assert_response :success
    end

    test "should update tutorial_category" do
      patch tutorial_category_url(@tutorial_category), params: { tutorial_category: {  } }
      assert_redirected_to tutorial_category_url(@tutorial_category)
    end

    test "should destroy tutorial_category" do
      assert_difference('Tutorial::Category.count', -1) do
        delete tutorial_category_url(@tutorial_category)
      end

      assert_redirected_to tutorial_categories_url
    end
  end
end
