json.extract! onboarding_step_input, :id, :onboarding_step_id, :input_type, :name, :placeholder, :info, :image, :created_at, :updated_at
json.url onboarding_step_input_url(onboarding_step_input, format: :json, onboarding_step_id: onboarding_step_input.onboarding_step_id)
