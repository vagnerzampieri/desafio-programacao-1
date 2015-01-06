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

ActiveRecord::Schema.define(version: 20150106194721) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "sales", force: :cascade do |t|
    t.string   "purchaser_name"
    t.string   "item_description"
    t.float    "item_price"
    t.integer  "purchase_count"
    t.string   "merchant_address"
    t.string   "merchant_name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "sales", ["item_description"], name: "index_sales_on_item_description", using: :btree
  add_index "sales", ["merchant_name"], name: "index_sales_on_merchant_name", using: :btree
  add_index "sales", ["purchaser_name"], name: "index_sales_on_purchaser_name", using: :btree

end
