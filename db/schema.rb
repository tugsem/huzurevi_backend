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

ActiveRecord::Schema[7.1].define(version: 2023_12_09_170941) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

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

  add_foreign_key "stock_logs", "stocks", on_delete: :nullify
end
