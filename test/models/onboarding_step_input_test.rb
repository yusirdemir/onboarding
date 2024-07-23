require "test_helper"

class OnboardingStepInputTest < ActiveSupport::TestCase
  def setup
    @input = create(:onboarding_step_input)
  end

  test "should be valid" do
    assert @input.valid?
  end

  test "should require an onboarding_step" do
    @input.onboarding_step = nil
    assert_not @input.valid?
  end

  test "should require an input_type" do
    @input.input_type = " "
    assert_not @input.valid?
  end
end
