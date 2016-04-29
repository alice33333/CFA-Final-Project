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

ActiveRecord::Schema.define(version: 20160429052115) do

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at",                                                  null: false
    t.datetime "updated_at",                                                  null: false
    t.string   "password_digest"
    t.string   "remember_digest"
    t.boolean  "admin",                                       default: false
    t.integer  "role"
    t.string   "username"
    t.decimal  "question_one",        precision: 2, scale: 1
    t.integer  "one_counter"
    t.float    "current_one"
    t.float    "total_one"
    t.decimal  "question_two",        precision: 2, scale: 1
    t.integer  "two_counter"
    t.float    "current_two"
    t.float    "total_two"
    t.decimal  "question_three",      precision: 2, scale: 1
    t.integer  "three_counter"
    t.float    "current_three"
    t.float    "total_three"
    t.decimal  "question_four",       precision: 2, scale: 1
    t.integer  "four_counter"
    t.float    "current_four"
    t.float    "total_four"
    t.decimal  "question_five",       precision: 2, scale: 1
    t.integer  "five_counter"
    t.float    "current_five"
    t.float    "total_five"
    t.boolean  "leader",                                      default: false
    t.boolean  "manager",                                     default: false
    t.decimal  "extra_one",           precision: 2, scale: 1
    t.integer  "extra_one_counter"
    t.float    "current_extra_one"
    t.float    "total_extra_one"
    t.decimal  "extra_two",           precision: 2, scale: 1, default: 0.0
    t.integer  "extra_two_counter"
    t.float    "current_extra_two"
    t.float    "total_extra_two"
    t.decimal  "extra_three",         precision: 2, scale: 1, default: 0.0
    t.integer  "extra_three_counter"
    t.float    "current_extra_three"
    t.float    "total_extra_three"
    t.decimal  "extra_four",          precision: 2, scale: 1, default: 0.0
    t.integer  "extra_four_counter"
    t.float    "current_extra_four"
    t.float    "total_extra_four"
    t.decimal  "extra_five",          precision: 2, scale: 1, default: 0.0
    t.integer  "extra_five_counter"
    t.float    "current_extra_five"
    t.float    "total_extra_five"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true

end
