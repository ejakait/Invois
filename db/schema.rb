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

ActiveRecord::Schema.define(version: 20160614075006) do

  create_table "active_admin_comments", force: :cascade do |t|
    t.string   "namespace",     limit: 255
    t.text     "body",          limit: 65535
    t.string   "resource_id",   limit: 255,   null: false
    t.string   "resource_type", limit: 255,   null: false
    t.integer  "author_id",     limit: 4
    t.string   "author_type",   limit: 255
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "active_admin_comments", ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id", using: :btree
  add_index "active_admin_comments", ["namespace"], name: "index_active_admin_comments_on_namespace", using: :btree
  add_index "active_admin_comments", ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id", using: :btree

  create_table "admin_users", force: :cascade do |t|
    t.string   "email",                  limit: 255, default: "", null: false
    t.string   "encrypted_password",     limit: 255, default: "", null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,   default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.datetime "created_at",                                      null: false
    t.datetime "updated_at",                                      null: false
  end

  add_index "admin_users", ["email"], name: "index_admin_users_on_email", unique: true, using: :btree
  add_index "admin_users", ["reset_password_token"], name: "index_admin_users_on_reset_password_token", unique: true, using: :btree

  create_table "invoicing_ledger_items", force: :cascade do |t|
    t.integer  "sender_id",    limit: 4
    t.integer  "recipient_id", limit: 4
    t.string   "type",         limit: 255
    t.datetime "issue_date"
    t.string   "currency",     limit: 3,                            null: false
    t.decimal  "total_amount",             precision: 20, scale: 4
    t.decimal  "tax_amount",               precision: 20, scale: 4
    t.string   "status",       limit: 20
    t.string   "identifier",   limit: 50
    t.string   "description",  limit: 255
    t.datetime "period_start"
    t.datetime "period_end"
    t.string   "uuid",         limit: 40
    t.datetime "due_date"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "invoicing_line_items", force: :cascade do |t|
    t.integer  "ledger_item_id", limit: 4
    t.string   "type",           limit: 255
    t.decimal  "net_amount",                 precision: 20, scale: 4
    t.decimal  "tax_amount",                 precision: 20, scale: 4
    t.string   "description",    limit: 255
    t.string   "uuid",           limit: 40
    t.datetime "tax_point"
    t.decimal  "quantity",                   precision: 20, scale: 4
    t.integer  "creator_id",     limit: 4
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "invoicing_tax_rates", force: :cascade do |t|
    t.string   "description",    limit: 255
    t.decimal  "rate",                       precision: 20, scale: 4
    t.datetime "valid_from",                                          null: false
    t.datetime "valid_until"
    t.integer  "replaced_by_id", limit: 4
    t.boolean  "is_default"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
