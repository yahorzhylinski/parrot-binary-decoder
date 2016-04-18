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

ActiveRecord::Schema.define(version: 20160418212305) do

  create_table "sensor_values", force: :cascade do |t|
    t.integer  "sensor_id",       limit: 4
    t.datetime "capture_time"
    t.integer  "air_temperature", limit: 4
    t.integer  "light",           limit: 4
    t.integer  "soil_moisture",   limit: 4
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  add_index "sensor_values", ["sensor_id", "capture_time"], name: "index_sensor_values_on_sensor_id_and_capture_time", unique: true, using: :btree

end
