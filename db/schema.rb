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

ActiveRecord::Schema.define(version: 20150214194115) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "carts", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
  end

  create_table "categories", force: true do |t|
    t.string   "title"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "sale_id"
  end

  add_index "categories", ["sale_id"], name: "index_categories_on_sale_id", using: :btree

  create_table "categories_items", force: true do |t|
    t.integer  "category_id"
    t.integer  "item_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "categories_items", ["category_id"], name: "index_categories_items_on_category_id", using: :btree
  add_index "categories_items", ["item_id"], name: "index_categories_items_on_item_id", using: :btree

  create_table "items", force: true do |t|
    t.string   "title"
    t.string   "description"
    t.float    "price"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "category_id"
    t.string   "photo_file_name"
    t.string   "photo_content_type"
    t.integer  "photo_file_size"
    t.datetime "photo_updated_at"
    t.string   "state",              default: "open"
    t.integer  "sale_id"
  end

  add_index "items", ["sale_id"], name: "index_items_on_sale_id", using: :btree
  add_index "items", ["title"], name: "index_items_on_title", using: :btree

  create_table "line_items", force: true do |t|
    t.integer  "item_id"
    t.integer  "cart_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "quantity",   default: 0
    t.integer  "order_id"
  end

  add_index "line_items", ["cart_id"], name: "index_line_items_on_cart_id", using: :btree
  add_index "line_items", ["item_id"], name: "index_line_items_on_item_id", using: :btree
  add_index "line_items", ["order_id"], name: "index_line_items_on_order_id", using: :btree

  create_table "orders", force: true do |t|
    t.string   "name"
    t.text     "address"
    t.string   "email"
    t.string   "pay_type"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
    t.string   "status",       default: "ordered"
    t.datetime "purchased_at"
  end

  add_index "orders", ["user_id"], name: "index_orders_on_user_id", using: :btree

  create_table "payment_notifications", force: true do |t|
    t.text     "params"
    t.string   "status"
    t.string   "transaction_id"
    t.integer  "order_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "reviews", force: true do |t|
    t.string   "title"
    t.text     "body"
    t.integer  "stars"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "item_id"
    t.integer  "user_id"
  end

  create_table "sales", force: true do |t|
    t.string   "name"
    t.decimal  "discount"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "name"
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.boolean  "admin",           default: false
  end

  add_index "users", ["email"], name: "index_users_on_email", using: :btree

end
