class OnboardingStepsController < ApplicationController
  before_action :set_onboarding_step, only: %i[ show update destroy ]

  # GET /onboarding_steps
  # GET /onboarding_steps.json
  def index
    @onboarding_steps = OnboardingStep.all
    @onboarding_steps.each do |step|
      step.is_locked = step.calculate_is_locked(params[:company_id])
    end
  end

  # GET /onboarding_steps/1
  # GET /onboarding_steps/1.json
  def show
    @onboarding_step.is_locked = @onboarding_step.calculate_is_locked(params[:company_id])
  end

  # POST /onboarding_steps
  # POST /onboarding_steps.json
  def create
    @onboarding_step = OnboardingStep.new(onboarding_step_params)

    if @onboarding_step.save
      @onboarding_step.is_locked = @onboarding_step.calculate_is_locked(params[:company_id])
      render :show, status: :created
    else
      render json: @onboarding_step.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /onboarding_steps/1
  # PATCH/PUT /onboarding_steps/1.json
  def update
    if @onboarding_step.update(onboarding_step_params)
      @onboarding_step.is_locked = @onboarding_step.calculate_is_locked(params[:company_id])
      render :show, status: :ok
    else
      render json: @onboarding_step.errors, status: :unprocessable_entity
    end
  end

  # DELETE /onboarding_steps/1
  # DELETE /onboarding_steps/1.json
  def destroy
    @onboarding_step.destroy!
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_onboarding_step
      @onboarding_step = OnboardingStep.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def onboarding_step_params
      params.require(:onboarding_step).permit(:order, :title, :description, :instructional_video_url, :instructional_video_info, :is_skippable, :skippable_text)
    end
end
