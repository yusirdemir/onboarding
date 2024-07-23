class CreateCompanyOnboardingSteps < ActiveRecord::Migration[7.2]
  def change
    create_table :company_onboarding_steps do |t|
      t.references :onboarding_step, null: false, foreign_key: true
      t.integer :company_id, null: false
      t.json :data
      t.boolean :is_skipped, null: false

      t.timestamps
    end
  end
end
