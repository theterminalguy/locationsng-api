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

ActiveRecord::Schema.define(version: 20160725134951) do

  create_table "areas", force: :cascade do |t|
    t.integer "town_id"
    t.string  "name"
  end

  add_index "areas", ["town_id"], name: "index_areas_on_town_id"

  create_table "post_codes", force: :cascade do |t|
    t.integer "area_id"
    t.integer "code"
    t.text    "streets"
  end

  add_index "post_codes", ["area_id"], name: "index_post_codes_on_area_id"
  add_index "post_codes", ["code"], name: "index_post_codes_on_code"

  create_table "rural_districts", force: :cascade do |t|
    t.integer "rural_lga_id"
    t.string  "name"
  end

  add_index "rural_districts", ["rural_lga_id"], name: "index_rural_districts_on_rural_lga_id"

  create_table "rural_lgas", force: :cascade do |t|
    t.integer "state_id"
    t.string  "name"
  end

  add_index "rural_lgas", ["state_id"], name: "index_rural_lgas_on_state_id"

  create_table "states", force: :cascade do |t|
    t.string  "code"
    t.string  "name"
    t.string  "capital"
    t.float   "lat"
    t.float   "lng"
    t.integer "zone_id"
  end

  create_table "streets", force: :cascade do |t|
    t.integer "area_id"
    t.string  "name"
  end

  add_index "streets", ["area_id"], name: "index_streets_on_area_id"

  create_table "towns", force: :cascade do |t|
    t.integer "state_id"
    t.string  "name"
  end

  add_index "towns", ["state_id"], name: "index_towns_on_state_id"

  create_table "zones", force: :cascade do |t|
    t.string "code"
    t.string "name"
  end

end
