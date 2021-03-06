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

ActiveRecord::Schema.define(version: 20200124015049) do

  create_table "cards", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.integer  "user_id"
    t.string   "customer_id"
    t.string   "card_id"
    t.string   "token"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "categories", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "ancestry"
    t.string   "name",       null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "images", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "image",      null: false
    t.integer  "item_id",    null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["item_id"], name: "index_images_on_item_id", using: :btree
  end

  create_table "items", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "name",          null: false
    t.string   "explanation",   null: false
    t.integer  "status",        null: false
    t.integer  "delivery_type", null: false
    t.integer  "postage",       null: false
    t.integer  "region",        null: false
    t.integer  "shipping_date", null: false
    t.integer  "price",         null: false
    t.string   "brand"
    t.integer  "category_id"
    t.integer  "saler_id",      null: false
    t.integer  "buyer_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["buyer_id"], name: "index_items_on_buyer_id", using: :btree
    t.index ["category_id"], name: "index_items_on_category_id", using: :btree
    t.index ["saler_id"], name: "index_items_on_saler_id", using: :btree
  end

  create_table "sns_credentials", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "provider"
    t.string   "uid"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_sns_credentials_on_user_id", using: :btree
  end

  create_table "users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "email",                                  default: "", null: false
    t.string   "name",                                   default: "", null: false
    t.string   "encrypted_password",                     default: "", null: false
    t.string   "nickname",                               default: "", null: false
    t.string   "phone_number",                                        null: false
    t.string   "prefectures",                                         null: false
    t.string   "city",                                                null: false
    t.string   "address",                                             null: false
    t.string   "postal_code",                                         null: false
    t.string   "building_name"
    t.integer  "birth_year",                                          null: false
    t.integer  "birth_month",                                         null: false
    t.integer  "birth_day",                                           null: false
    t.string   "first_name",                                          null: false
    t.string   "first_name_kana",                                     null: false
    t.string   "last_name",                                           null: false
    t.string   "last_name_kana",                                      null: false
    t.string   "first_name_delivery"
    t.string   "first_name_kana_delivery"
    t.string   "last_name_delivery"
    t.string   "last_name_kana_delivery"
    t.string   "phone_number_delivery"
    t.string   "exhibit_product"
    t.integer  "exhibit_number"
    t.integer  "points"
    t.integer  "like"
    t.integer  "earnings"
    t.integer  "purchase_history_id"
    t.integer  "sales_history_id"
    t.text     "profile",                  limit: 65535
    t.string   "card_id"
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at",                                          null: false
    t.datetime "updated_at",                                          null: false
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  add_foreign_key "images", "items"
  add_foreign_key "items", "categories"
  add_foreign_key "items", "users", column: "buyer_id"
  add_foreign_key "items", "users", column: "saler_id"
  add_foreign_key "sns_credentials", "users"
end
