class CreateOnboardingStepDependencies < ActiveRecord::Migration[7.2]
  def change
    create_table :onboarding_step_dependencies do |t|
      t.references :onboarding_step, null: false, foreign_key: true
      t.string :dependency_type, null: false

      t.timestamps
    end
  end
end
