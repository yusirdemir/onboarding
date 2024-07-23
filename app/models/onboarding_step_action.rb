class OnboardingStepAction < ApplicationRecord
  belongs_to :onboarding_step

  validates :action_type, presence: true
  validates :action_class, presence: true
end
