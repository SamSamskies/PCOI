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

ActiveRecord::Schema.define(version: 20131116094222) do

  create_table "countries", force: true do |t|
    t.string   "name"
    t.integer  "region_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "countries_sectors", force: true do |t|
    t.integer "country_id"
    t.integer "sector_id"
  end

  create_table "jobs", force: true do |t|
    t.string   "application_deadline"
    t.string   "departure_date"
    t.string   "description"
<<<<<<< HEAD
    t.string   "notification_date"
    t.integer  "open_positions"
    t.text     "physical_requirements"
    t.integer  "quarter"
    t.text     "skills"
    t.string   "year"
    t.integer  "sector_id"
=======
    t.integer  "country_id"
>>>>>>> master
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "regions", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sectors", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
