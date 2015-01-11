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

ActiveRecord::Schema.define(version: 20150111053932) do

  create_table "patients", force: true do |t|
    t.string   "name",              null: false
    t.string   "phone_number",      null: false
    t.string   "email",             null: false
    t.string   "password_digest",   null: false
    t.string   "diagnosis"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "insurance_company"
  end

  add_index "patients", ["email"], name: "index_patients_on_email", unique: true

  create_table "pending_patients", force: true do |t|
    t.string   "name",               null: false
    t.string   "email",              null: false
    t.string   "insurance_company"
    t.string   "diagnosis"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "verification_token"
    t.integer  "pt_id"
  end

  add_index "pending_patients", ["email"], name: "index_pending_patients_on_email", unique: true
  add_index "pending_patients", ["pt_id"], name: "index_pending_patients_on_pt_id"

  create_table "pt_patients", force: true do |t|
    t.integer  "pt_id",      null: false
    t.integer  "patient_id", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "pt_patients", ["patient_id"], name: "index_pt_patients_on_patient_id"
  add_index "pt_patients", ["pt_id"], name: "index_pt_patients_on_pt_id"

  create_table "pts", force: true do |t|
    t.string   "name",                            null: false
    t.string   "phone_number",                    null: false
    t.string   "email",                           null: false
    t.string   "password_digest",                 null: false
    t.boolean  "admin",           default: false
    t.integer  "clinic_id",                       null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "pts", ["clinic_id"], name: "index_pts_on_clinic_id"
  add_index "pts", ["email"], name: "index_pts_on_email", unique: true

  create_table "sessions", force: true do |t|
    t.string   "token",            null: false
    t.integer  "sessionable_id"
    t.string   "sessionable_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "sessions", ["sessionable_id", "sessionable_type"], name: "index_sessions_on_sessionable_id_and_sessionable_type"

end
