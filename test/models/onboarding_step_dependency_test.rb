require "test_helper"

class OnboardingStepDependencyTest < ActiveSupport::TestCase
  def setup
    @dependency = create(:onboarding_step_dependency)
  end

  test "should be valid" do
    assert @dependency.valid?
  end

  test "dependency_type should be present" do
    @dependency.dependency_type = " "
    assert_not @dependency.valid?
  end
end
