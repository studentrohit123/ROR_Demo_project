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

ActiveRecord::Schema[7.1].define(version: 2024_08_22_093530) do
  create_table "bookings", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "bus_id", null: false
    t.date "date"
    t.string "seat_type"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "seat_no"
    t.string "name"
    t.integer "age"
    t.string "gender"
    t.index ["bus_id"], name: "index_bookings_on_bus_id"
    t.index ["user_id"], name: "index_bookings_on_user_id"
  end

  create_table "buses", force: :cascade do |t|
    t.string "name"
    t.string "number"
    t.string "total_seats"
    t.string "bus_class"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "route_id"
    t.time "departure_time"
    t.time "arrival_time"
    t.decimal "price"
    t.index ["route_id"], name: "index_buses_on_route_id"
  end

  create_table "routes", force: :cascade do |t|
    t.string "source"
    t.string "destination"
    t.string "distance"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "trains", force: :cascade do |t|
    t.string "name"
    t.string "number"
    t.integer "total_seats"
    t.string "train_class"
    t.time "departure_time"
    t.time "arrival_time"
    t.decimal "price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "route_id"
    t.index ["route_id"], name: "index_trains_on_route_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "bookings", "buses"
  add_foreign_key "bookings", "users"
  add_foreign_key "buses", "routes"
  add_foreign_key "trains", "routes"
end
