require "test_helper"

class OnboardingStepActionTest < ActiveSupport::TestCase
  def setup
    @action = create(:onboarding_step_action)
  end

  test "should be valid" do
    assert @action.valid?
  end

  test "action_class should be present" do
    @action.action_class = " "
    assert_not @action.valid?
  end
end
