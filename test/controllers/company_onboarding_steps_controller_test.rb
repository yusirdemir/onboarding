require "test_helper"

class CompanyOnboardingStepsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @company_id = 1
    @onboarding_step1 = create(:onboarding_step)
    @onboarding_step2 = create(:onboarding_step)
    @onboarding_step3 = create(:onboarding_step)
    @company_onboarding_step = create(:company_onboarding_step, onboarding_step: @onboarding_step1)
    @company_onboarding_step2 = create(:company_onboarding_step, onboarding_step: @onboarding_step2)
    @onboarding_step_action1 = create(:onboarding_step_action, onboarding_step: @onboarding_step1, action_class: "LeadTimeUpdater", action_type: "service")
    @onboarding_step_action2 = create(:onboarding_step_action, onboarding_step: @onboarding_step2, action_class: "RefreshCalculationsWorker", action_type: "worker")
  end

  test "should get index" do
    get company_onboarding_steps_url(company_id: @company_id), as: :json
    assert_response :success
  end

  test "should get sync_progress" do
    get sync_progress_company_onboarding_steps_url(company_id: @company_id), as: :json

    assert_response :success

    response_body = JSON.parse(@response.body)

    assert response_body.key?("progress")

    progress = response_body["progress"]
    assert progress.key?("company_id")
    assert progress.key?("total_completion_percentage")
    assert progress.key?("warehouses")
    assert progress.key?("products")
    assert progress.key?("vendors")
    assert progress.key?("saleshistory")

    assert_nil progress["company_id"], "Expected company_id to be nil"

    assert progress["warehouses"].is_a?(Hash)
    assert progress["products"].is_a?(Hash)
    assert progress["vendors"].is_a?(Hash)
    assert progress["saleshistory"].is_a?(Hash)

    assert_includes progress["warehouses"].keys, "total"
    assert_includes progress["warehouses"].keys, "fetched"
    assert_includes progress["warehouses"].keys, "completion_percentage"

    assert_includes progress["products"].keys, "total"
    assert_includes progress["products"].keys, "fetched"
    assert_includes progress["products"].keys, "completion_percentage"

    assert_includes progress["vendors"].keys, "total"
    assert_includes progress["vendors"].keys, "fetched"
    assert_includes progress["vendors"].keys, "completion_percentage"

    assert_includes progress["saleshistory"].keys, "total"
    assert_includes progress["saleshistory"].keys, "fetched"
    assert_includes progress["saleshistory"].keys, "completion_percentage"
  end

  test "should get current step with company_id" do
    get current_step_company_onboarding_steps_url(company_id: @company_id), as: :json
    assert_response :success
    response_data = JSON.parse(@response.body)

    assert response_data.key?("company_onboarding")
    assert response_data.key?("current_onboarding")
    assert response_data.key?("next_onboarding")
  end

  test "should create company_onboarding_step" do
    assert_difference("CompanyOnboardingStep.count") do
      post company_onboarding_steps_url, params: { company_onboarding_step: {
        company_id: @company_onboarding_step.company_id,
        data: @company_onboarding_step.data,
        is_skipped: @company_onboarding_step.is_skipped,
        onboarding_step_id: @company_onboarding_step.onboarding_step_id
      } }, as: :json
    end

    assert_response :created
  end

  test "should create company_onboarding_step and trigger LeadTimeUpdater service" do
    assert_difference("CompanyOnboardingStep.count") do
      post company_onboarding_steps_url, params: { company_onboarding_step: {
        company_id: @company_onboarding_step.company_id,
        data: @company_onboarding_step.data,
        is_skipped: @company_onboarding_step.is_skipped,
        onboarding_step_id: @company_onboarding_step.onboarding_step_id
      } }, as: :json
    end

    assert_response :created
  end

  test "should create company_onboarding_step and trigger RefreshCalculationsWorker" do
    assert_difference("CompanyOnboardingStep.count") do
      post company_onboarding_steps_url, params: { company_onboarding_step: {
        company_id: @company_onboarding_step2.company_id,
        data: @company_onboarding_step2.data,
        is_skipped: @company_onboarding_step2.is_skipped,
        onboarding_step_id: @company_onboarding_step2.onboarding_step_id
      } }, as: :json
    end

    assert_response :created
  end

  test "should show company_onboarding_step" do
    get company_onboarding_step_url(@company_onboarding_step), as: :json
    assert_response :success
  end

  test "should update company_onboarding_step" do
    patch company_onboarding_step_url(@company_onboarding_step), params: { company_onboarding_step: { company_id: @company_onboarding_step.company_id, data: @company_onboarding_step.data, is_skipped: @company_onboarding_step.is_skipped, onboarding_step_id: @company_onboarding_step.onboarding_step_id } }, as: :json
    assert_response :success
  end

  test "should destroy company_onboarding_step" do
    assert_difference("CompanyOnboardingStep.count", -1) do
      delete company_onboarding_step_url(@company_onboarding_step), as: :json
    end

    assert_response :no_content
  end
end
