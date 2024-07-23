class OnboardingStep < ApplicationRecord
  attr_accessor :is_locked

  default_scope { order(order: :asc) }

  has_many :onboarding_step_inputs, dependent: :destroy
  has_many :onboarding_step_actions, dependent: :destroy
  has_many :onboarding_step_dependencies, dependent: :destroy
  has_one :company_onboarding_step, dependent: :destroy

  validates :order, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 1 }, uniqueness: true
  validates :title, presence: true
  validates :description, presence: true
  validates :is_skippable, inclusion: { in: [true, false], message: "must be true or false" }

  def calculate_is_locked(company_id = nil)
    return check_dependencies_exist? if company_id.nil?

    dependencies = onboarding_step_dependencies
    return false if dependencies.empty?

    progress = SyncProgressService.new(company_id).progress

    !all_dependencies_satisfied?(dependencies, progress)
  end

  private

  def check_dependencies_exist?
    onboarding_step_dependencies.exists?
  end

  def all_dependencies_satisfied?(dependencies, progress)
    dependencies.all? do |dependency|
      dependency_satisfied?(dependency, progress)
    end
  end

  def dependency_satisfied?(dependency, progress)
    case dependency.dependency_type
    when "sync_warehouses"
      progress[:warehouses][:completion_percentage] == 100
    when "sync_products"
      progress[:products][:completion_percentage] == 100
    when "sync_vendors"
      progress[:vendors][:completion_percentage] == 100
    when "sync_sales_histories"
      progress[:saleshistory][:completion_percentage] == 100
    else
      false
    end
  end
end
