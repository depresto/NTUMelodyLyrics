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

ActiveRecord::Schema.define(version: 20160518172713) do

  create_table "borrow_lists", force: :cascade do |t|
    t.string   "club_property_id"
    t.integer  "user_id"
    t.date     "deadline"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  create_table "calendars", force: :cascade do |t|
    t.string   "title",  null: false
    t.boolean  "allday"
    t.string   "color"
    t.string   "type"
    t.datetime "start"
    t.datetime "end"
  end

  create_table "club_properties", force: :cascade do |t|
    t.string  "name",                       null: false
    t.boolean "borrowable", default: false
    t.string  "type"
    t.string  "image"
  end

  create_table "images", force: :cascade do |t|
    t.string "name",    null: false
    t.string "storage", null: false
  end

  create_table "login_tokens", force: :cascade do |t|
    t.string "s_id"
    t.string "token"
  end

  create_table "schedule_contents", force: :cascade do |t|
    t.string  "content",     null: false
    t.integer "schedule_id", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "s_id",                          null: false
    t.string   "name",                          null: false
    t.string   "password_salt",                 null: false
    t.string   "password_hash",                 null: false
    t.datetime "created_at",                    null: false
    t.datetime "updated_at",                    null: false
    t.boolean  "rememberred",   default: false, null: false
    t.boolean  "isadmin",       default: false, null: false
  end

end
