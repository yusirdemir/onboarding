class CreateOnboardingStepActions < ActiveRecord::Migration[7.2]
  def change
    create_table :onboarding_step_actions do |t|
      t.references :onboarding_step, null: false, foreign_key: true
      t.string :action_type, null: false
      t.string :action_class, null: false

      t.timestamps
    end
  end
end
