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

ActiveRecord::Schema.define(version: 20150531082426) do

  create_table "admin_users", force: :cascade do |t|
    t.string   "email",           limit: 255, default: "", null: false
    t.datetime "created_at",                               null: false
    t.datetime "updated_at",                               null: false
    t.string   "password_digest", limit: 255
  end

  create_table "comments", force: :cascade do |t|
    t.integer  "user_id",    limit: 4
    t.string   "email",      limit: 255, default: "", null: false
    t.string   "comment",    limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: :cascade do |t|
    t.string   "name",       limit: 25
    t.string   "email",      limit: 255, default: "", null: false
    t.integer  "interval",   limit: 4,   default: 90
    t.integer  "count",      limit: 4,   default: 10
    t.string   "password",   limit: 40
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "your_wills", force: :cascade do |t|
    t.integer  "user_id",    limit: 4
    t.string   "content",    limit: 255
    t.string   "email",      limit: 255, default: "", null: false
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
  end

end
