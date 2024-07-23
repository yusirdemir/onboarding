require "test_helper"

class OnboardingStepActionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @onboarding_step = create(:onboarding_step)
    @onboarding_step_action = create(:onboarding_step_action, onboarding_step: @onboarding_step)
  end

  test "should get index" do
    get onboarding_step_actions_url(@onboarding_step), as: :json
    assert_response :success
  end

  test "should create onboarding_step_action" do
    assert_difference("OnboardingStepAction.count") do
      post onboarding_step_actions_url(@onboarding_step), params: { onboarding_step_action: {
        action_class: "LeadTimeUpdater",
        action_type: "service",
        onboarding_step_id: @onboarding_step.id
      } }, as: :json
    end

    assert_response :created
  end

  test "should show onboarding_step_action" do
    get onboarding_step_action_url(@onboarding_step,@onboarding_step_action), as: :json
    assert_response :success
  end

  test "should update onboarding_step_action" do
    patch onboarding_step_action_url(@onboarding_step,@onboarding_step_action), params: { onboarding_step_action: { action_class: @onboarding_step_action.action_class, action_type: @onboarding_step_action.action_type, onboarding_step_id: @onboarding_step_action.onboarding_step_id } }, as: :json
    assert_response :success
  end

  test "should destroy onboarding_step_action" do
    assert_difference("OnboardingStepAction.count", -1) do
      delete onboarding_step_action_url(@onboarding_step,@onboarding_step_action), as: :json
    end

    assert_response :no_content
  end
end
