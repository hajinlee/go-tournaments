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

ActiveRecord::Schema.define(version: 2018_12_07_063028) do

  create_table "tournament_admins", id: false, force: :cascade do |t|
    t.integer "tournament_id"
    t.integer "user_id"
    t.index ["tournament_id"], name: "index_tournament_admins_on_tournament_id"
    t.index ["user_id"], name: "index_tournament_admins_on_user_id"
  end

  create_table "tournament_games", force: :cascade do |t|
    t.integer "tournament_id"
    t.integer "white_id"
    t.integer "black_id"
    t.integer "round_number"
    t.integer "result"
    t.index ["tournament_id"], name: "index_tournament_games_on_tournament_id"
  end

  create_table "tournament_player_scores", force: :cascade do |t|
    t.integer "tournament_id"
    t.integer "round_number"
    t.integer "user_id"
    t.integer "mms"
    t.integer "wins"
    t.integer "sos"
    t.integer "sosos"
    t.index ["tournament_id"], name: "index_tournament_player_scores_on_tournament_id"
    t.index ["user_id"], name: "index_tournament_player_scores_on_user_id"
  end

  create_table "tournament_registrations", force: :cascade do |t|
    t.integer "tournament_id"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "checked_in"
    t.index ["tournament_id"], name: "index_tournament_registrations_on_tournament_id"
    t.index ["user_id"], name: "index_tournament_registrations_on_user_id"
  end

  create_table "tournaments", force: :cascade do |t|
    t.string "title"
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
    t.integer "game_rules"
    t.integer "is_rated"
    t.string "registration_fee"
    t.string "time_setting"
    t.time "check_in_begins"
    t.time "first_round_begins"
    t.string "image_file_name"
    t.string "image_content_type"
    t.integer "image_file_size"
    t.datetime "image_updated_at"
    t.integer "author_user_id"
  end

  create_table "user_profiles", force: :cascade do |t|
    t.string "avatar_file_name"
    t.string "avatar_content_type"
    t.integer "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.integer "membership_number"
    t.string "rating"
    t.text "clubs"
    t.text "interested_cities"
    t.integer "user_id"
    t.integer "rating_organization"
    t.index ["user_id"], name: "index_user_profiles_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.integer "aga_number"
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.string "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string "unconfirmed_email"
    t.integer "failed_attempts", default: 0, null: false
    t.string "unlock_token"
    t.datetime "locked_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "is_admin", default: 0
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["unlock_token"], name: "index_users_on_unlock_token", unique: true
  end

end
