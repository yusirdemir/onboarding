json.extract! onboarding_step_dependency, :id, :onboarding_step_id, :dependency_type, :created_at, :updated_at
json.url onboarding_step_dependency_url(onboarding_step_dependency, format: :json, onboarding_step_id: onboarding_step_dependency.onboarding_step_id)
