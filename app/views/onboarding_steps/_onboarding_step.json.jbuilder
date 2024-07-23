json.extract! onboarding_step, :id, :order, :title, :description, :instructional_video_url, :instructional_video_info, :is_skippable, :skippable_text, :is_locked, :created_at, :updated_at
json.url onboarding_step_url(onboarding_step, format: :json)

json.inputs onboarding_step.onboarding_step_inputs do |input|
  json.extract! input, :id, :input_type, :name, :placeholder, :info, :image, :created_at, :updated_at
end

json.actions onboarding_step.onboarding_step_actions do |action|
  json.extract! action, :id, :action_type, :action_class, :created_at, :updated_at
end

json.dependencies onboarding_step.onboarding_step_dependencies do |dependency|
  json.extract! dependency, :id, :dependency_type, :created_at, :updated_at
end
