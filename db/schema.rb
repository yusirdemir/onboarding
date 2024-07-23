# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.2].define(version: 2024_07_21_065345) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "company_onboarding_steps", force: :cascade do |t|
    t.bigint "onboarding_step_id", null: false
    t.integer "company_id", null: false
    t.json "data"
    t.boolean "is_skipped", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["onboarding_step_id"], name: "index_company_onboarding_steps_on_onboarding_step_id"
  end

  create_table "onboarding_step_actions", force: :cascade do |t|
    t.bigint "onboarding_step_id", null: false
    t.string "action_type", null: false
    t.string "action_class", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["onboarding_step_id"], name: "index_onboarding_step_actions_on_onboarding_step_id"
  end

  create_table "onboarding_step_dependencies", force: :cascade do |t|
    t.bigint "onboarding_step_id", null: false
    t.string "dependency_type", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["onboarding_step_id"], name: "index_onboarding_step_dependencies_on_onboarding_step_id"
  end

  create_table "onboarding_step_inputs", force: :cascade do |t|
    t.bigint "onboarding_step_id", null: false
    t.string "input_type", null: false
    t.string "name"
    t.string "placeholder"
    t.string "info"
    t.string "image"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["onboarding_step_id"], name: "index_onboarding_step_inputs_on_onboarding_step_id"
  end

  create_table "onboarding_steps", force: :cascade do |t|
    t.integer "order", null: false
    t.string "title", null: false
    t.text "description", null: false
    t.string "instructional_video_url"
    t.string "instructional_video_info"
    t.boolean "is_skippable", default: false, null: false
    t.string "skippable_text"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["order"], name: "index_onboarding_steps_on_order", unique: true
  end

  add_foreign_key "company_onboarding_steps", "onboarding_steps"
  add_foreign_key "onboarding_step_actions", "onboarding_steps"
  add_foreign_key "onboarding_step_dependencies", "onboarding_steps"
  add_foreign_key "onboarding_step_inputs", "onboarding_steps"
end
