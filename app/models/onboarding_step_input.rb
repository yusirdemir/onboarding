class OnboardingStepInput < ApplicationRecord
  belongs_to :onboarding_step

  validates :input_type, presence: true
  validates :input_type, inclusion: { in: %w[text number file button checkbox] }
end
