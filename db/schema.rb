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

ActiveRecord::Schema.define(version: 2018_05_07_174955) do

  create_table "tournaments", force: :cascade do |t|
    t.integer "tournament_id"
    t.string "title"
    t.string "image"
    t.string "venue"
    t.string "city"
    t.string "state"
    t.string "organizer"
    t.string "contact"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "description"
    t.date "start_date"
    t.date "end_date"
    t.string "country"
    t.string "password_digest"
    t.string "game_rules"
    t.boolean "is_rated"
    t.string "registration_fee"
    t.string "time_setting"
    t.time "check_in_begins"
    t.time "first_round_begins"
  end

end
