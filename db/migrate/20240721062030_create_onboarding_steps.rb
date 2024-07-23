class CreateOnboardingSteps < ActiveRecord::Migration[7.2]
  def change
    create_table :onboarding_steps do |t|
      t.integer :order, null: false
      t.string :title, null: false
      t.text :description, null: false
      t.string :instructional_video_url
      t.string :instructional_video_info
      t.boolean :is_skippable, null: false, default: false
      t.string :skippable_text

      t.timestamps
    end

    add_index :onboarding_steps, :order, unique: true
  end
end
