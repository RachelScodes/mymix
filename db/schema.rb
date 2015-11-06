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

ActiveRecord::Schema.define(version: 20151106051015) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "mixtapes", force: :cascade do |t|
    t.string   "name"
    t.string   "dedication"
    t.string   "about"
    t.datetime "created_at",                                                                                                        null: false
    t.datetime "updated_at",                                                                                                        null: false
    t.string   "img_src",    default: "http://i.dailymail.co.uk/i/pix/2013/01/08/article-2259055-16CF09AC000005DC-960_634x587.jpg"
  end

  create_table "recordings", force: :cascade do |t|
    t.integer  "song_id"
    t.integer  "mixtape_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "recordings", ["mixtape_id"], name: "index_recordings_on_mixtape_id", using: :btree
  add_index "recordings", ["song_id"], name: "index_recordings_on_song_id", using: :btree

  create_table "songs", force: :cascade do |t|
    t.string   "title"
    t.string   "artist"
    t.string   "album"
    t.date     "date_released"
    t.string   "src_url"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.integer  "user_id"
  end

  add_index "songs", ["user_id"], name: "index_songs_on_user_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "dj_name"
    t.string   "avatar"
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "users", ["avatar"], name: "index_users_on_avatar", unique: true, using: :btree
  add_index "users", ["dj_name"], name: "index_users_on_dj_name", unique: true, using: :btree
  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree

  add_foreign_key "songs", "users"
end
