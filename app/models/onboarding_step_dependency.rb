class OnboardingStepDependency < ApplicationRecord
  belongs_to :onboarding_step

  validates :dependency_type, presence: true
  validates :dependency_type, inclusion: { in: %w[sync_warehouses sync_products sync_vendors sync_sales_histories] }
end
