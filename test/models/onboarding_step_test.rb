require "test_helper"

class OnboardingStepTest < ActiveSupport::TestCase
  def setup
    @onboarding_step = create(:onboarding_step)
  end

  test "should be valid" do
    assert @onboarding_step.valid?
  end

  test "title should be present" do
    @onboarding_step.title = " "
    assert_not @onboarding_step.valid?
  end

  test "description should be present" do
    @onboarding_step.description = " "
    assert_not @onboarding_step.valid?
  end

  test "order should be a number" do
    @onboarding_step.order = "string"
    assert_not @onboarding_step.valid?
  end
end
