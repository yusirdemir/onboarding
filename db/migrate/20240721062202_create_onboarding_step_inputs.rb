class CreateOnboardingStepInputs < ActiveRecord::Migration[7.2]
  def change
    create_table :onboarding_step_inputs do |t|
      t.references :onboarding_step, null: false, foreign_key: true
      t.string :input_type, null: false
      t.string :name
      t.string :placeholder
      t.string :info
      t.string :image

      t.timestamps
    end
  end
end
