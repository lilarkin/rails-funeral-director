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

ActiveRecord::Schema.define(version: 20170225171634) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "deceaseds", force: :cascade do |t|
    t.integer  "mortuary_id"
    t.string   "first_name",  null: false
    t.string   "last_name",   null: false
    t.string   "birthdate",   null: false
    t.string   "deathdate",   null: false
    t.string   "cod",         null: false
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["mortuary_id"], name: "index_deceaseds_on_mortuary_id", using: :btree
  end

  create_table "funerals", force: :cascade do |t|
    t.integer  "deceased_id"
    t.string   "location",    null: false
    t.string   "time",        null: false
    t.string   "date",        null: false
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["deceased_id"], name: "index_funerals_on_deceased_id", using: :btree
  end

  create_table "mortuaries", force: :cascade do |t|
    t.string   "name",       null: false
    t.string   "city"
    t.string   "state"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "user_id"
    t.index ["user_id"], name: "index_mortuaries_on_user_id", using: :btree
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
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "first_name"
    t.string   "last_name"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "provider"
    t.string   "uid"
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["provider"], name: "index_users_on_provider", using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
    t.index ["uid"], name: "index_users_on_uid", using: :btree
  end

  add_foreign_key "deceaseds", "mortuaries"
  add_foreign_key "funerals", "deceaseds"
end
