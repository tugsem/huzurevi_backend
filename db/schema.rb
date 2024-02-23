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

ActiveRecord::Schema[7.1].define(version: 2024_02_19_191331) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "medication_records", force: :cascade do |t|
    t.integer "patient_id"
    t.string "medication_name"
    t.string "dosage"
    t.datetime "administration_time"
    t.integer "nurse_id"
    t.text "note"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["nurse_id"], name: "index_medication_records_on_nurse_id"
    t.index ["patient_id"], name: "index_medication_records_on_patient_id"
  end

  create_table "nurses", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.date "date_of_birth"
    t.string "gender"
    t.string "contact_number"
    t.string "email"
    t.string "username"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_nurses_on_email"
  end

  create_table "patients", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.date "date_of_birth"
    t.string "contact_number"
    t.string "email"
    t.string "gender"
    t.string "address"
    t.text "medical_history"
    t.text "medications"
    t.integer "assigned_nurse_id"
    t.integer "room_number"
    t.string "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "nurses_id"
    t.index ["assigned_nurse_id"], name: "index_patients_on_assigned_nurse_id"
    t.index ["email"], name: "index_patients_on_email"
    t.index ["nurses_id"], name: "index_patients_on_nurses_id"
  end

  create_table "stock_logs", force: :cascade do |t|
    t.string "stock_name"
    t.integer "quantity"
    t.string "to_whom"
    t.integer "operation"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "stock_id"
    t.index ["stock_id"], name: "index_stock_logs_on_stock_id"
  end

  create_table "stocks", force: :cascade do |t|
    t.string "name"
    t.integer "quantity"
    t.string "unit"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "username"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "password_digest"
    t.boolean "admin", default: false
  end

  add_foreign_key "patients", "nurses", column: "nurses_id"
  add_foreign_key "stock_logs", "stocks", on_delete: :nullify
end
