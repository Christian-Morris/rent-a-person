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

ActiveRecord::Schema[7.0].define(version: 2023_08_24_072656) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "availabilities", force: :cascade do |t|
    t.date "from_date"
    t.date "to_date"
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_availabilities_on_user_id"
  end

  create_table "bookings", force: :cascade do |t|
    t.bigint "occasion_id", null: false
    t.bigint "escort_id", null: false
    t.bigint "renter_id", null: false
    t.date "start_date"
    t.date "end_date"
    t.string "location"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "status", default: "pending"
    t.index ["escort_id"], name: "index_bookings_on_escort_id"
    t.index ["occasion_id"], name: "index_bookings_on_occasion_id"
    t.index ["renter_id"], name: "index_bookings_on_renter_id"
  end

  create_table "occasions", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "reviews", force: :cascade do |t|
    t.bigint "escort_id", null: false
    t.bigint "renter_id", null: false
    t.string "comment"
    t.integer "rating"
    t.bigint "booking_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["booking_id"], name: "index_reviews_on_booking_id"
    t.index ["escort_id"], name: "index_reviews_on_escort_id"
    t.index ["renter_id"], name: "index_reviews_on_renter_id"
  end

  create_table "user_occasions", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.bigint "occasion_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["occasion_id"], name: "index_user_occasions_on_occasion_id"
    t.index ["user_id"], name: "index_user_occasions_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.string "full_name"
    t.integer "age"
    t.string "gender"
    t.string "location"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "availabilities", "users"
  add_foreign_key "bookings", "occasions"
  add_foreign_key "bookings", "users", column: "escort_id"
  add_foreign_key "bookings", "users", column: "renter_id"
  add_foreign_key "reviews", "bookings"
  add_foreign_key "reviews", "users", column: "escort_id"
  add_foreign_key "reviews", "users", column: "renter_id"
  add_foreign_key "user_occasions", "occasions"
  add_foreign_key "user_occasions", "users"
end
