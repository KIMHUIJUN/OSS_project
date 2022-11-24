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

ActiveRecord::Schema.define(version: 2022_11_23_064512) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "albums", force: :cascade do |t|
    t.string "title"
    t.string "release_com"
    t.string "activity_type"
    t.string "release_day"
    t.text "genre"
    t.text "intro"
    t.integer "recommend"
    t.bigint "artist_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "album_link"
    t.index ["artist_id"], name: "index_albums_on_artist_id"
  end

  create_table "artists", force: :cascade do |t|
    t.string "agency"
    t.string "nationality"
    t.string "activity_name"
    t.string "real_name"
    t.string "sex"
    t.text "genre"
    t.text "nickname"
    t.text "intro"
    t.text "award_history"
    t.text "link"
    t.text "activity_type"
    t.string "debut_day"
    t.string "birth_day"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "social_auths", force: :cascade do |t|
    t.string "provider", null: false
    t.string "uid", null: false
    t.string "first_name"
    t.string "last_name"
    t.string "email"
    t.string "photo"
    t.bigint "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_social_auths_on_user_id"
  end

  create_table "tracks", force: :cascade do |t|
    t.string "title"
    t.integer "recommend"
    t.string "flac"
    t.string "genre"
    t.text "lyrics"
    t.bigint "album_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "track_play"
    t.index ["album_id"], name: "index_tracks_on_album_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", null: false
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "videos", force: :cascade do |t|
    t.text "src"
    t.text "intro"
    t.bigint "track_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["track_id"], name: "index_videos_on_track_id"
  end

  add_foreign_key "albums", "artists"
  add_foreign_key "tracks", "albums"
  add_foreign_key "videos", "tracks"
end
