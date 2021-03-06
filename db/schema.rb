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

ActiveRecord::Schema.define(version: 20170118074020) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "colleges", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "code"
  end

  create_table "permissions", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "role_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "roles", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "student_technologies", force: :cascade do |t|
    t.integer  "student_id"
    t.integer  "technology_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  create_table "students", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.string   "mobile"
    t.boolean  "beneficial"
    t.text     "feedback"
    t.boolean  "joining"
    t.boolean  "consult"
    t.text     "suggestion"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.integer  "college_id"
    t.integer  "workshop_id"
    t.string   "college_code"
    t.string   "university"
    t.string   "stream"
  end

  create_table "technologies", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "",     null: false
    t.string   "encrypted_password",     default: "",     null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,      null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                              null: false
    t.datetime "updated_at",                              null: false
    t.string   "role",                   default: "user"
    t.integer  "college_id"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  create_table "workshop_types", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "workshops", force: :cascade do |t|
    t.string   "name"
    t.string   "students_count"
    t.string   "amount"
    t.string   "fee"
    t.integer  "college_id"
    t.integer  "workshop_type_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.date     "start_date"
    t.date     "end_date"
  end

  add_index "workshops", ["college_id"], name: "index_workshops_on_college_id", using: :btree
  add_index "workshops", ["workshop_type_id"], name: "index_workshops_on_workshop_type_id", using: :btree

  add_foreign_key "workshops", "colleges"
  add_foreign_key "workshops", "workshop_types"
end
