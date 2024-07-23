require "test_helper"

class OnboardingStepInputsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @onboarding_step = create(:onboarding_step)
    @onboarding_step_input = create(:onboarding_step_input, onboarding_step: @onboarding_step)
  end

  test "should get index" do
    get onboarding_step_inputs_url(@onboarding_step), as: :json
    assert_response :success
  end

  test "should create onboarding_step_input" do
    assert_difference("OnboardingStepInput.count") do
      post onboarding_step_inputs_url(@onboarding_step), params: { onboarding_step_input: {
        image: "http://example.com/image.png",
        info: "Sample info",
        name: "Sample Name",
        placeholder: "Sample Placeholder",
        input_type: "text"
      } }, as: :json
    end

    assert_response :created
  end

  test "should show onboarding_step_input" do
    get onboarding_step_input_url(@onboarding_step, @onboarding_step_input), as: :json
    assert_response :success
  end

  test "should update onboarding_step_input" do
    patch onboarding_step_input_url(@onboarding_step, @onboarding_step_input), params: { onboarding_step_input: { image: @onboarding_step_input.image, info: @onboarding_step_input.info, name: @onboarding_step_input.name, placeholder: @onboarding_step_input.placeholder, input_type: @onboarding_step_input.input_type } }, as: :json
    assert_response :success
  end

  test "should destroy onboarding_step_input" do
    assert_difference("OnboardingStepInput.count", -1) do
      delete onboarding_step_input_url(@onboarding_step, @onboarding_step_input), as: :json
    end

    assert_response :no_content
  end
end
