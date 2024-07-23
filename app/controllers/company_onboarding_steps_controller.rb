class CompanyOnboardingStepsController < ApplicationController
  before_action :set_company_onboarding_step, only: %i[ show update destroy ]

  # GET /company_onboarding_steps
  # GET /company_onboarding_steps.json
  def index
    if params[:company_id].present?
      @company_onboarding_steps = CompanyOnboardingStep.where(company_id: params[:company_id])
      render json: @company_onboarding_steps
    else
      render json: { error: "must_be_company_id" }, status: :bad_request
    end
  end

  # GET /company_onboarding_steps/sync_progress
  # GET /company_onboarding_steps/sync_progress.json
  def sync_progress
    company_id = params[:company_id]
    @progress = SyncProgressService.new(company_id).progress
    render :sync_progress
  end

  # GET /company_onboarding_steps/current_step
  # GET /company_onboarding_steps/current_step.json
  def current_step
    company_id = params[:company_id]

    if company_id.present?
      @current_onboarding_step = CompanyOnboardingStep.where(company_id: company_id)
                                                      .order(created_at: :desc)
                                                      .first

      if @current_onboarding_step
        @total_steps = OnboardingStep.count
        @completed_steps = CompanyOnboardingStep.where(company_id: company_id).count

        @status = @completed_steps == @total_steps ? "completed" : "in_progress"

        @next_onboarding_step = OnboardingStep.find_by(order: @current_onboarding_step.onboarding_step.order + 1)

        render :current_step
      else
        render json: { error: "not_exist" }, status: :not_found
      end
    else
      render json: { error: "must_be_company_id" }, status: :bad_request
    end
  end

  # GET /company_onboarding_steps/1
  # GET /company_onboarding_steps/1.json
  def show
  end

  # POST /company_onboarding_steps
  # POST /company_onboarding_steps.json
  def create
    @company_onboarding_step = CompanyOnboardingStep.new(company_onboarding_step_params)

    if @company_onboarding_step.save
      render :show, status: :created
    else
      render json: @company_onboarding_step.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /company_onboarding_steps/1
  # PATCH/PUT /company_onboarding_steps/1.json
  def update
    if @company_onboarding_step.update(company_onboarding_step_params)
      render :show, status: :ok
    else
      render json: @company_onboarding_step.errors, status: :unprocessable_entity
    end
  end

  # DELETE /company_onboarding_steps/1
  # DELETE /company_onboarding_steps/1.json
  def destroy
    @company_onboarding_step.destroy!
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_company_onboarding_step
      @company_onboarding_step = CompanyOnboardingStep.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def company_onboarding_step_params
      params.require(:company_onboarding_step).permit(:onboarding_step_id, :company_id, :data, :is_skipped)
    end
end
