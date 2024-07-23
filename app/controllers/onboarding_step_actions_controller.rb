class OnboardingStepActionsController < ApplicationController
  before_action :set_onboarding_step_action, only: %i[ show update destroy ]

  # GET /onboarding_step_actions
  # GET /onboarding_step_actions.json
  def index
    @onboarding_step_actions = OnboardingStepAction.all
  end

  # GET /onboarding_step_actions/1
  # GET /onboarding_step_actions/1.json
  def show
  end

  # POST /onboarding_step_actions
  # POST /onboarding_step_actions.json
  def create
    @onboarding_step_action = OnboardingStepAction.new(onboarding_step_action_params)

    if @onboarding_step_action.save
      render :show, status: :created
    else
      render json: @onboarding_step_action.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /onboarding_step_actions/1
  # PATCH/PUT /onboarding_step_actions/1.json
  def update
    if @onboarding_step_action.update(onboarding_step_action_params)
      render :show, status: :ok
    else
      render json: @onboarding_step_action.errors, status: :unprocessable_entity
    end
  end

  # DELETE /onboarding_step_actions/1
  # DELETE /onboarding_step_actions/1.json
  def destroy
    @onboarding_step_action.destroy!
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_onboarding_step_action
      @onboarding_step_action = OnboardingStepAction.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def onboarding_step_action_params
      permitted_params = params.require(:onboarding_step_action).permit(:action_type, :action_class)
      permitted_params.merge(onboarding_step_id: params[:onboarding_step_id])
    end
end
