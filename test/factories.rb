FactoryBot.define do
  factory :onboarding_step do
    title { "Sample Title" }
    description { "Sample Description" }
    sequence(:order) { |n| n }
    instructional_video_url { "http://example.com" }
    instructional_video_info { "Sample Video Info" }
    is_skippable { false }
    skippable_text { "" }
  end
end

FactoryBot.define do
  factory :onboarding_step_input do
    association :onboarding_step
    input_type { "text" }
    name { "Sample Name" }
    placeholder { "Sample Placeholder" }
    info { "Sample Info" }
    image { "" }
  end
end
FactoryBot.define do
  factory :onboarding_step_action do
    association :onboarding_step
    action_type { "service" }
    action_class { "LeadTimeUpdater" }
  end
end

FactoryBot.define do
  factory :onboarding_step_dependency do
    association :onboarding_step
    dependency_type { "sync_products" }
  end
end

FactoryBot.define do
  factory :company_onboarding_step do
    association :onboarding_step
    company_id { 1 }
    data { }
    is_skipped { false }
  end
end