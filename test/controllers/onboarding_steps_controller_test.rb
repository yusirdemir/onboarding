require "test_helper"

class OnboardingStepsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @company_id = 1
    @onboarding_step = create(:onboarding_step)
    @onboarding_step_with_dependencies = create(:onboarding_step)
    @dependency = create(:onboarding_step_dependency, onboarding_step: @onboarding_step_with_dependencies)
  end

  test "should get index" do
    get onboarding_steps_url, as: :json
    assert_response :success
  end

  test "should create onboarding_step" do
    assert_difference("OnboardingStep.count") do
      post onboarding_steps_url, params: { onboarding_step: {
        title: "New Onboarding Step",
        description: "This is a new onboarding step",
        order: 999,
        instructional_video_url: "http://example.com/new_video",
        instructional_video_info: "New Video Info",
        is_skippable: true,
        skippable_text: "You can skip this step"
      } }, as: :json
    end

    assert_response :created
  end

  test "should show onboarding_step" do
    get onboarding_step_url(@onboarding_step), as: :json
    assert_response :success
  end

  test "should show onboarding_step with is_locked" do
    get onboarding_step_url(@onboarding_step_with_dependencies, company_id: @company_id), as: :json
    assert_response :success
    response_data = JSON.parse(@response.body)
    assert_equal false, response_data["is_locked"]
  end

  test "should show onboarding_step with is_locked 2" do
    get onboarding_step_url(@onboarding_step_with_dependencies), as: :json
    assert_response :success
    response_data = JSON.parse(@response.body)
    assert_equal true, response_data["is_locked"]
  end

  test "should update onboarding_step" do
    patch onboarding_step_url(@onboarding_step), params: { onboarding_step: { description: @onboarding_step.description, instructional_video_info: @onboarding_step.instructional_video_info, instructional_video_url: @onboarding_step.instructional_video_url, is_skippable: @onboarding_step.is_skippable, order: @onboarding_step.order, skippable_text: @onboarding_step.skippable_text, title: @onboarding_step.title } }, as: :json
    assert_response :success
  end

  test "should destroy onboarding_step" do
    assert_difference("OnboardingStep.count", -1) do
      delete onboarding_step_url(@onboarding_step), as: :json
    end

    assert_response :no_content
  end
end
