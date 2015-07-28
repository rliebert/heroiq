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

ActiveRecord::Schema.define(version: 20150702225714) do

  create_table "listings", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.date     "mfr_date"
    t.string   "serial_no"
    t.decimal  "rental_price_per_day"
    t.decimal  "rental_price_per_wk"
    t.decimal  "security_deposit"
    t.decimal  "sale_price"
    t.boolean  "accept_offers"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
    t.integer  "product_id"
  end

  create_table "photos", force: :cascade do |t|
    t.integer  "listing_id"
    t.integer  "product_id"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.text     "caption"
  end

  create_table "products", force: :cascade do |t|
    t.string   "prod_type"
    t.string   "brand_name"
    t.string   "prod_name"
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

end
