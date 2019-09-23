require "application_system_test_case"

module PhcdevworksTutorials
  class Tutorial::StepsTest < ApplicationSystemTestCase
    setup do
      @tutorial_step = phcdevworks_tutorials_tutorial_steps(:one)
    end

    test "visiting the index" do
      visit tutorial_steps_url
      assert_selector "h1", text: "Tutorial/Steps"
    end

    test "creating a Step" do
      visit tutorial_steps_url
      click_on "New Tutorial/Step"

      fill_in "Tutorial step body", with: @tutorial_step.tutorial_step_body
      fill_in "Tutorial step number", with: @tutorial_step.tutorial_step_number
      click_on "Create Step"

      assert_text "Step was successfully created"
      click_on "Back"
    end

    test "updating a Step" do
      visit tutorial_steps_url
      click_on "Edit", match: :first

      fill_in "Tutorial step body", with: @tutorial_step.tutorial_step_body
      fill_in "Tutorial step number", with: @tutorial_step.tutorial_step_number
      click_on "Update Step"

      assert_text "Step was successfully updated"
      click_on "Back"
    end

    test "destroying a Step" do
      visit tutorial_steps_url
      page.accept_confirm do
        click_on "Destroy", match: :first
      end

      assert_text "Step was successfully destroyed"
    end
  end
end
