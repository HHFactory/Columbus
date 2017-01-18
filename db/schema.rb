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

ActiveRecord::Schema.define(version: 20170105143103) do

  create_table "departments", force: :cascade do |t|
    t.string "name", limit: 255, null: false
  end

  create_table "employees", force: :cascade do |t|
    t.string  "name",          limit: 255, null: false
    t.string  "tel_num",       limit: 255
    t.integer "department_id", limit: 4
  end

  create_table "item_images", force: :cascade do |t|
    t.string   "url_path",   limit: 255, null: false
    t.string   "division",   limit: 255, null: false
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.integer  "item_id",    limit: 4
  end

  create_table "item_user_links", force: :cascade do |t|
    t.integer "item_id", limit: 4
    t.integer "user_id", limit: 4
  end

  create_table "items", force: :cascade do |t|
    t.string   "status",          limit: 255, null: false
    t.datetime "pick_date",                   null: false
    t.string   "characteristic",  limit: 255, null: false
    t.string   "pick_location",   limit: 255, null: false
    t.string   "manage_location", limit: 255, null: false
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "name",          limit: 255, null: false
    t.string   "tel_num",       limit: 255
    t.string   "mail_address",  limit: 255
    t.string   "line_id",       limit: 255
    t.string   "prefecture",    limit: 255
    t.string   "city",          limit: 255
    t.string   "address",       limit: 255
    t.string   "address_other", limit: 255
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

end
