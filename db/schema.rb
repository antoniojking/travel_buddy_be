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

ActiveRecord::Schema.define(version: 2021_09_21_221328) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "accommodations", force: :cascade do |t|
    t.bigint "trip_id"
    t.string "name"
    t.string "location"
    t.string "details"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["trip_id"], name: "index_accommodations_on_trip_id"
  end

  create_table "activities", force: :cascade do |t|
    t.bigint "trip_id"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["trip_id"], name: "index_activities_on_trip_id"
  end

  create_table "checklist_items", force: :cascade do |t|
    t.bigint "checklist_id"
    t.bigint "user_id"
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["checklist_id"], name: "index_checklist_items_on_checklist_id"
    t.index ["user_id"], name: "index_checklist_items_on_user_id"
  end

  create_table "checklists", force: :cascade do |t|
    t.bigint "trip_id"
    t.string "category"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["trip_id"], name: "index_checklists_on_trip_id"
  end

  create_table "friendships", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "friend_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["friend_id"], name: "index_friendships_on_friend_id"
    t.index ["user_id"], name: "index_friendships_on_user_id"
  end

  create_table "travel_buddies", force: :cascade do |t|
    t.bigint "trip_id"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["trip_id"], name: "index_travel_buddies_on_trip_id"
    t.index ["user_id"], name: "index_travel_buddies_on_user_id"
  end

  create_table "trips", force: :cascade do |t|
    t.datetime "start_date"
    t.datetime "end_date"
    t.string "park_code"
    t.string "name", default: "New Trip"
    t.bigint "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "park_name"
    t.index ["user_id"], name: "index_trips_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "token"
    t.string "refresh_token"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "spotify_id"
  end

  add_foreign_key "accommodations", "trips"
  add_foreign_key "activities", "trips"
  add_foreign_key "checklist_items", "checklists"
  add_foreign_key "checklists", "trips"
  add_foreign_key "friendships", "users"
  add_foreign_key "travel_buddies", "trips"
  add_foreign_key "travel_buddies", "users"
  add_foreign_key "trips", "users"
end
