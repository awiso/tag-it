# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2018_08_16_163803) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bookings", force: :cascade do |t|
    t.bigint "wall_id"
    t.bigint "user_id"
    t.date "date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "status", default: "pending"
    t.text "initial_message"
    t.index ["user_id"], name: "index_bookings_on_user_id"
    t.index ["wall_id"], name: "index_bookings_on_wall_id"
  end

  create_table "completed_projects", force: :cascade do |t|
    t.string "name"
    t.string "description"
    t.string "collaborators"
    t.string "photo"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "wall_id"
    t.index ["user_id"], name: "index_completed_projects_on_user_id"
    t.index ["wall_id"], name: "index_completed_projects_on_wall_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.string "avatar"
    t.string "display_name"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "walls", force: :cascade do |t|
    t.string "address"
    t.text "description"
    t.string "photo"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.float "latitude"
    t.float "longitude"
    t.index ["user_id"], name: "index_walls_on_user_id"
  end

  add_foreign_key "bookings", "users"
  add_foreign_key "bookings", "walls"
  add_foreign_key "completed_projects", "users"
  add_foreign_key "completed_projects", "walls"
  add_foreign_key "walls", "users"
end
