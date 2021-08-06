require 'test_helper'

class TargetScoresControllerTest < ActionDispatch::IntegrationTest
  setup do
    @target_score = target_scores(:one)
  end

  test "should get index" do
    get target_scores_url
    assert_response :success
  end

  test "should get new" do
    get new_target_score_url
    assert_response :success
  end

  test "should create target_score" do
    assert_difference('TargetScore.count') do
      post target_scores_url, params: { target_score: { english: @target_score.english, math: @target_score.math, science: @target_score.science, student_id: @target_score.student_id } }
    end

    assert_redirected_to target_score_url(TargetScore.last)
  end

  test "should show target_score" do
    get target_score_url(@target_score)
    assert_response :success
  end

  test "should get edit" do
    get edit_target_score_url(@target_score)
    assert_response :success
  end

  test "should update target_score" do
    patch target_score_url(@target_score), params: { target_score: { english: @target_score.english, math: @target_score.math, science: @target_score.science, student_id: @target_score.student_id } }
    assert_redirected_to target_score_url(@target_score)
  end

  test "should destroy target_score" do
    assert_difference('TargetScore.count', -1) do
      delete target_score_url(@target_score)
    end

    assert_redirected_to target_scores_url
  end
end
