json.extract! onboarding_step_action, :id, :onboarding_step_id, :action_type, :action_class, :created_at, :updated_at
json.url onboarding_step_action_url(onboarding_step_action, format: :json, onboarding_step_id: onboarding_step_action.onboarding_step_id)
