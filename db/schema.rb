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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20110414150412) do

  create_table "stations", :force => true do |t|
    t.string   "line"
    t.string   "platformkey"
    t.string   "platformname"
    t.string   "stationname"
    t.integer  "platformorder"
    t.boolean  "startofline"
    t.boolean  "endofline"
    t.string   "branch"
    t.string   "direction"
    t.string   "stop_id"
    t.string   "stop_name"
    t.decimal  "stop_lat",      :precision => 8, :scale => 6
    t.decimal  "stop_lon",      :precision => 8, :scale => 6
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
