require "test_helper"

class CompanyOnboardingStepTest < ActiveSupport::TestCase
  def setup
    @company_onboarding_step = create(:company_onboarding_step)
  end

  test "should be valid" do
    assert @company_onboarding_step.valid?
  end

  test "should require an onboarding_step" do
    @company_onboarding_step.onboarding_step = nil
    assert_not @company_onboarding_step.valid?
  end

  test "should require a company_id" do
    @company_onboarding_step.company_id = nil
    assert_not @company_onboarding_step.valid?
  end

  test "should respond to onboarding_step" do
    assert_respond_to @company_onboarding_step, :onboarding_step
  end

  test "should have a valid company_id" do
    @company_onboarding_step.company_id = nil
    assert_not @company_onboarding_step.valid?
  end
end
