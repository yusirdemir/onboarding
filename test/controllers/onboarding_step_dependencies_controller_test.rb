require "test_helper"

class OnboardingStepDependenciesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @onboarding_step = create(:onboarding_step)
    @onboarding_step_dependency = create(:onboarding_step_dependency, onboarding_step: @onboarding_step)
  end

  test "should get index" do
    get onboarding_step_dependencies_url(@onboarding_step), as: :json
    assert_response :success
  end

  test "should create onboarding_step_dependency" do
    assert_difference("OnboardingStepDependency.count") do
      post onboarding_step_dependencies_url(@onboarding_step), params: { onboarding_step_dependency: {
        onboarding_step_id: @onboarding_step.id,
        dependency_type: "sync_products"
      } }, as: :json
    end

    assert_response :created
  end

  test "should show onboarding_step_dependency" do
    get onboarding_step_dependency_url(@onboarding_step, @onboarding_step_dependency), as: :json
    assert_response :success
  end

  test "should update onboarding_step_dependency" do
    patch onboarding_step_dependency_url(@onboarding_step, @onboarding_step_dependency), params: { onboarding_step_dependency: { onboarding_step_id: @onboarding_step_dependency.onboarding_step_id, dependency_type: @onboarding_step_dependency.dependency_type } }, as: :json
    assert_response :success
  end

  test "should destroy onboarding_step_dependency" do
    assert_difference("OnboardingStepDependency.count", -1) do
      delete onboarding_step_dependency_url(@onboarding_step, @onboarding_step_dependency), as: :json
    end

    assert_response :no_content
  end
end
