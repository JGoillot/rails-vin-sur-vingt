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

ActiveRecord::Schema.define(version: 20160818133038) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "attachinary_files", force: :cascade do |t|
    t.string   "attachinariable_type"
    t.integer  "attachinariable_id"
    t.string   "scope"
    t.string   "public_id"
    t.string   "version"
    t.integer  "width"
    t.integer  "height"
    t.string   "format"
    t.string   "resource_type"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["attachinariable_type", "attachinariable_id", "scope"], name: "by_scoped_parent", using: :btree
  end

  create_table "bottle_lots", force: :cascade do |t|
    t.string   "dimension"
    t.integer  "year"
    t.string   "color"
    t.string   "appelation"
    t.integer  "quantity"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_bottle_lots_on_user_id", using: :btree
  end

  create_table "cellars", force: :cascade do |t|
    t.text     "description"
    t.string   "address"
    t.integer  "space_available"
    t.integer  "price_per_month"
    t.string   "kind"
    t.integer  "temperature"
    t.string   "open_hour"
    t.integer  "user_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.float    "latitude"
    t.float    "longitude"
    t.index ["user_id"], name: "index_cellars_on_user_id", using: :btree
  end

  create_table "conversations", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "cellar_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["cellar_id"], name: "index_conversations_on_cellar_id", using: :btree
    t.index ["user_id"], name: "index_conversations_on_user_id", using: :btree
  end

  create_table "messages", force: :cascade do |t|
    t.text     "content"
    t.integer  "user_id"
    t.integer  "conversation_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.index ["conversation_id"], name: "index_messages_on_conversation_id", using: :btree
    t.index ["user_id"], name: "index_messages_on_user_id", using: :btree
  end

  create_table "reservation_bottles", force: :cascade do |t|
    t.integer  "reservation_id"
    t.integer  "bottle_lot_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.index ["bottle_lot_id"], name: "index_reservation_bottles_on_bottle_lot_id", using: :btree
    t.index ["reservation_id"], name: "index_reservation_bottles_on_reservation_id", using: :btree
  end

  create_table "reservations", force: :cascade do |t|
    t.date     "check_in"
    t.date     "check_out"
    t.text     "review"
    t.integer  "grade"
    t.integer  "cellar_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "user_id"
    t.index ["cellar_id"], name: "index_reservations_on_cellar_id", using: :btree
    t.index ["user_id"], name: "index_reservations_on_user_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "first_name"
    t.string   "last_name"
    t.date     "birthdate"
    t.string   "provider"
    t.string   "uid"
    t.string   "facebook_picture_url"
    t.string   "token"
    t.datetime "token_expiry"
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  add_foreign_key "bottle_lots", "users"
  add_foreign_key "cellars", "users"
  add_foreign_key "conversations", "cellars"
  add_foreign_key "conversations", "users"
  add_foreign_key "messages", "conversations"
  add_foreign_key "messages", "users"
  add_foreign_key "reservation_bottles", "bottle_lots"
  add_foreign_key "reservation_bottles", "reservations"
  add_foreign_key "reservations", "cellars"
  add_foreign_key "reservations", "users"
end
