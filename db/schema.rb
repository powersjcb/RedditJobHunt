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

ActiveRecord::Schema.define(version: 20150530225502) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "groups", force: :cascade do |t|
    t.integer  "user_id",                  null: false
    t.string   "name",                     null: false
    t.text     "description", default: "", null: false
    t.text     "url",         default: "", null: false
    t.text     "img_url",     default: "", null: false
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  add_index "groups", ["name"], name: "index_groups_on_name", unique: true, using: :btree

  create_table "listings", force: :cascade do |t|
    t.integer  "organization_id",              null: false
    t.integer  "user_id",                      null: false
    t.string   "name",                         null: false
    t.text     "description",     default: "", null: false
    t.text     "url",             default: "", null: false
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
  end

  add_index "listings", ["name"], name: "index_listings_on_name", using: :btree
  add_index "listings", ["organization_id"], name: "index_listings_on_organization_id", using: :btree

  create_table "memberships", force: :cascade do |t|
    t.integer  "user_id",    null: false
    t.integer  "group_id",   null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "memberships", ["group_id", "user_id"], name: "index_memberships_on_group_id_and_user_id", unique: true, using: :btree
  add_index "memberships", ["group_id"], name: "index_memberships_on_group_id", using: :btree
  add_index "memberships", ["user_id"], name: "index_memberships_on_user_id", using: :btree

  create_table "opportunities", force: :cascade do |t|
    t.integer  "listing_id",                       null: false
    t.integer  "user_id",                          null: false
    t.string   "status",     default: "favorited", null: false
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
  end

  add_index "opportunities", ["listing_id"], name: "index_opportunities_on_listing_id", using: :btree
  add_index "opportunities", ["user_id", "listing_id"], name: "index_opportunities_on_user_id_and_listing_id", unique: true, using: :btree
  add_index "opportunities", ["user_id"], name: "index_opportunities_on_user_id", using: :btree

  create_table "organizations", force: :cascade do |t|
    t.integer  "group_id",                 null: false
    t.integer  "user_id",                  null: false
    t.string   "name",                     null: false
    t.text     "description", default: "", null: false
    t.text     "url",         default: "", null: false
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  add_index "organizations", ["group_id", "name"], name: "index_organizations_on_group_id_and_name", unique: true, using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "username",                        null: false
    t.string   "password_digest",                 null: false
    t.string   "session_token",                   null: false
    t.boolean  "admin",           default: false, null: false
    t.text     "profile",         default: "",    null: false
    t.text     "url",             default: "",    null: false
    t.text     "img_url",         default: "",    null: false
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.integer  "active_group_id"
  end

  add_index "users", ["session_token"], name: "index_users_on_session_token", unique: true, using: :btree
  add_index "users", ["username"], name: "index_users_on_username", unique: true, using: :btree

  create_table "votes", force: :cascade do |t|
    t.integer  "listing_id", null: false
    t.integer  "user_id",    null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "votes", ["listing_id"], name: "index_votes_on_listing_id", using: :btree
  add_index "votes", ["user_id", "listing_id"], name: "index_votes_on_user_id_and_listing_id", unique: true, using: :btree
  add_index "votes", ["user_id"], name: "index_votes_on_user_id", using: :btree

end
