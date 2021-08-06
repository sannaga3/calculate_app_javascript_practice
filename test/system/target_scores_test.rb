require "application_system_test_case"

class TargetScoresTest < ApplicationSystemTestCase
  setup do
    @target_score = target_scores(:one)
  end

  test "visiting the index" do
    visit target_scores_url
    assert_selector "h1", text: "Target Scores"
  end

  test "creating a Target score" do
    visit target_scores_url
    click_on "New Target Score"

    fill_in "English", with: @target_score.english
    fill_in "Math", with: @target_score.math
    fill_in "Science", with: @target_score.science
    fill_in "Student", with: @target_score.student_id
    click_on "Create Target score"

    assert_text "Target score was successfully created"
    click_on "Back"
  end

  test "updating a Target score" do
    visit target_scores_url
    click_on "Edit", match: :first

    fill_in "English", with: @target_score.english
    fill_in "Math", with: @target_score.math
    fill_in "Science", with: @target_score.science
    fill_in "Student", with: @target_score.student_id
    click_on "Update Target score"

    assert_text "Target score was successfully updated"
    click_on "Back"
  end

  test "destroying a Target score" do
    visit target_scores_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Target score was successfully destroyed"
  end
end
