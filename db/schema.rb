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

ActiveRecord::Schema.define(version: 20160613165209) do

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
