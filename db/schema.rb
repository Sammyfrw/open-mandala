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

ActiveRecord::Schema.define(version: 20141126132826) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "tickers", force: true do |t|
    t.integer  "ticker_type_id"
    t.string   "ticker"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "trade_types", force: true do |t|
    t.integer  "type_id"
    t.integer  "group"
    t.string   "symbol_name"
    t.string   "description"
    t.string   "deposit_description"
    t.string   "withdrawal_description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "trades", force: true do |t|
    t.datetime "trade_date"
    t.integer  "user_id"
    t.integer  "ticker_id"
    t.integer  "trade_type_id"
    t.float    "num_units"
    t.float    "price"
    t.integer  "parent_id"
    t.integer  "withdrawal_id"
    t.integer  "deposit_id"
    t.float    "commission"
    t.float    "reg_fee"
    t.float    "strike"
    t.datetime "expiration"
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "username"
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["username"], name: "index_users_on_username", unique: true, using: :btree

end
