class CompanyOnboardingStep < ApplicationRecord
  belongs_to :onboarding_step

  validates :company_id, presence: true
  validates :is_skipped, inclusion: { in: [ true, false ], message: "must be true or false" }

  before_save :check_onboarding_step_locked
  # before_save :validate_order_sequence
  after_save :trigger_onboarding_step_actions

  def status
    total_steps = OnboardingStep.count
    completed_steps = CompanyOnboardingStep.where(company_id: self.company_id).count

    if completed_steps == total_steps
      "completed"
    else
      "in_progress"
    end
  end

  private
  def check_onboarding_step_locked
    if self.onboarding_step.calculate_is_locked(self.company_id)
      errors.add(:base, "Onboarding step is locked and cannot be saved.")
      throw(:abort)
    end
  end

  def validate_order_sequence
    if onboarding_step.order.present?
      max_order = CompanyOnboardingStep.joins(:onboarding_step)
                                       .where(company_id: self.company_id)
                                       .pluck("MAX(onboarding_steps.order)")
                                       .first || 0

      if self.onboarding_step.order != max_order + 1
        errors.add(:order, "Order is not in the correct sequence.")
        throw(:abort)
      end
    end
  end

  def trigger_onboarding_step_actions
    actions = OnboardingStepAction.where(onboarding_step_id: self.onboarding_step_id)
    actions.each do |action|
      case action.action_type
      when "service"
        service_class = action.action_class.constantize
        service_class.new(self.company_id).perform
      when "worker"
        worker_class = action.action_class.constantize
        worker_class.perform_async(self.company_id)
      else
        Rails.logger.error("Unknown action_type: #{action.action_type}")
      end
    end
  end
end
