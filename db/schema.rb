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

ActiveRecord::Schema.define(version: 20140531145822) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "agencies", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "agencies_agency_codes", id: false, force: true do |t|
    t.integer "agency_id",      null: false
    t.integer "agency_code_id", null: false
  end

  add_index "agencies_agency_codes", ["agency_code_id", "agency_id"], name: "index_agencies_agency_codes_on_agency_code_id_and_agency_id", unique: true, using: :btree
  add_index "agencies_agency_codes", ["agency_id", "agency_code_id"], name: "index_agencies_agency_codes_on_agency_id_and_agency_code_id", unique: true, using: :btree

  create_table "agencies_locations", id: false, force: true do |t|
    t.integer "agency_id",   null: false
    t.integer "location_id", null: false
  end

  add_index "agencies_locations", ["agency_id", "location_id"], name: "index_agencies_locations_on_agency_id_and_location_id", unique: true, using: :btree
  add_index "agencies_locations", ["location_id", "agency_id"], name: "index_agencies_locations_on_location_id_and_agency_id", unique: true, using: :btree

  create_table "agency_codes", force: true do |t|
    t.string   "code"
    t.string   "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "agency_codes_item_codes", id: false, force: true do |t|
    t.integer "agency_code_id", null: false
    t.integer "item_code_id",   null: false
  end

  add_index "agency_codes_item_codes", ["agency_code_id", "item_code_id"], name: "agency_code_to_item_code_index", unique: true, using: :btree
  add_index "agency_codes_item_codes", ["item_code_id", "agency_code_id"], name: "item_code_to_agency_code_index", unique: true, using: :btree

  create_table "agency_reports", force: true do |t|
    t.integer  "report_id"
    t.integer  "agency_id"
    t.boolean  "completed"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "item_codes", force: true do |t|
    t.string   "code"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "items", force: true do |t|
    t.string   "name"
    t.float    "weight"
    t.integer  "quantity"
    t.decimal  "fee",          precision: 8, scale: 2
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "item_code_id"
  end

  add_index "items", ["item_code_id"], name: "index_items_on_item_code_id", using: :btree

  create_table "locations", force: true do |t|
    t.string   "code"
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "order_items", force: true do |t|
    t.integer  "item_id"
    t.integer  "order_id"
    t.integer  "quantity"
    t.decimal  "fee",        precision: 8, scale: 2
    t.float    "weight"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "order_items", ["order_id"], name: "index_order_items_on_order_id", using: :btree

  create_table "orders", force: true do |t|
    t.string   "requester"
    t.string   "recipient"
    t.datetime "delivery_date"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "agency_id"
    t.integer  "location_id"
  end

  add_index "orders", ["agency_id"], name: "index_orders_on_agency_id", using: :btree
  add_index "orders", ["location_id"], name: "index_orders_on_location_id", using: :btree

  create_table "reports", force: true do |t|
    t.string   "name"
    t.string   "link"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "searches", force: true do |t|
    t.string   "names"
    t.integer  "category_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.integer  "agency_id"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

end
