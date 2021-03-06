# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20140903174359) do

  create_table "hangouts", force: true do |t|
    t.integer  "user_id"
    t.integer  "mood_id"
    t.boolean  "accept",     default: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "hangouts", ["user_id", "mood_id"], name: "index_hangouts_on_user_id_and_mood_id", unique: true

  create_table "interests", force: true do |t|
    t.integer  "obii_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "interests", ["obii_id", "user_id"], name: "index_interests_on_obii_id_and_user_id", unique: true

  create_table "moods", force: true do |t|
    t.integer  "user_id"
    t.integer  "obii_id"
    t.integer  "maxgroup"
    t.integer  "mingroup"
    t.datetime "starts"
    t.datetime "ends"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "open",       default: true
  end

  create_table "obiis", force: true do |t|
    t.string   "name"
    t.string   "image"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "obiis", ["image"], name: "index_obiis_on_image", unique: true
  add_index "obiis", ["name"], name: "index_obiis_on_name", unique: true

  create_table "users", force: true do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "encrypted_password"
    t.string   "salt"
    t.string   "avatar"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["name"], name: "index_users_on_name", unique: true

end
