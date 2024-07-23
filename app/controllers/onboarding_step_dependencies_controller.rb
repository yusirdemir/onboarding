class OnboardingStepDependenciesController < ApplicationController
  before_action :set_onboarding_step_dependency, only: %i[ show update destroy ]

  # GET /onboarding_step_dependencies
  # GET /onboarding_step_dependencies.json
  def index
    @onboarding_step_dependencies = OnboardingStepDependency.where(onboarding_step_id: params[:onboarding_step_id])
  end

  # GET /onboarding_step_dependencies/1
  # GET /onboarding_step_dependencies/1.json
  def show
  end

  # POST /onboarding_step_dependencies
  # POST /onboarding_step_dependencies.json
  def create
    @onboarding_step_dependency = OnboardingStepDependency.new(onboarding_step_dependency_params)

    if @onboarding_step_dependency.save
      render :show, status: :created
    else
      render json: @onboarding_step_dependency.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /onboarding_step_dependencies/1
  # PATCH/PUT /onboarding_step_dependencies/1.json
  def update
    if @onboarding_step_dependency.update(onboarding_step_dependency_params)
      render :show, status: :ok
    else
      render json: @onboarding_step_dependency.errors, status: :unprocessable_entity
    end
  end

  # DELETE /onboarding_step_dependencies/1
  # DELETE /onboarding_step_dependencies/1.json
  def destroy
    @onboarding_step_dependency.destroy!
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_onboarding_step_dependency
      @onboarding_step_dependency = OnboardingStepDependency.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def onboarding_step_dependency_params
      permitted_params = params.require(:onboarding_step_dependency).permit(:dependency_type)
      permitted_params.merge(onboarding_step_id: params[:onboarding_step_id])
    end
end
