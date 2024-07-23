class OnboardingStepInputsController < ApplicationController
  before_action :set_onboarding_step_input, only: %i[ show update destroy ]

  # GET /onboarding_step_inputs
  # GET /onboarding_step_inputs.json
  def index
    @onboarding_step_inputs = OnboardingStepInput.where(onboarding_step_id: params[:onboarding_step_id])
  end

  # GET /onboarding_step_inputs/1
  # GET /onboarding_step_inputs/1.json
  def show
  end

  # POST /onboarding_step_inputs
  # POST /onboarding_step_inputs.json
  def create
    @onboarding_step_input = OnboardingStepInput.new(onboarding_step_input_params)

    if @onboarding_step_input.save
      render :show, status: :created
    else
      render json: @onboarding_step_input.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /onboarding_step_inputs/1
  # PATCH/PUT /onboarding_step_inputs/1.json
  def update
    if @onboarding_step_input.update(onboarding_step_input_params)
      render :show, status: :ok
    else
      render json: @onboarding_step_input.errors, status: :unprocessable_entity
    end
  end

  # DELETE /onboarding_step_inputs/1
  # DELETE /onboarding_step_inputs/1.json
  def destroy
    @onboarding_step_input.destroy!
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_onboarding_step_input
      @onboarding_step_input = OnboardingStepInput.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def onboarding_step_input_params
      permitted_params = params.require(:onboarding_step_input).permit(:input_type, :name, :placeholder, :info, :image)
      permitted_params.merge(onboarding_step_id: params[:onboarding_step_id])
    end
end
