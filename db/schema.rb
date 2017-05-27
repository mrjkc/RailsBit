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

ActiveRecord::Schema.define(version: 20170527205608) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "articles", force: :cascade do |t|
    t.string   "title"
    t.text     "text"
    t.boolean  "liked"
    t.string   "author_name"
    t.string   "image_link"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "picture"
  end

  create_table "comments", force: :cascade do |t|
    t.string   "comment"
    t.integer  "article_id"
    t.integer  "video_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "contact_us", force: :cascade do |t|
    t.string   "email"
    t.string   "phone"
    t.string   "name"
    t.string   "message"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "likes", force: :cascade do |t|
    t.boolean  "likes"
    t.integer  "article_id"
    t.integer  "video_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "qoutes", force: :cascade do |t|
    t.string   "quote"
    t.string   "author"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "subscriptions", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "userpanels", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "user_video"
    t.boolean  "html_video"
    t.boolean  "css_video"
    t.boolean  "js_video"
    t.boolean  "ror_video"
    t.boolean  "other_video"
    t.string   "exercise"
    t.boolean  "html_exercise"
    t.boolean  "css_exercise"
    t.boolean  "js_exercise"
    t.boolean  "ror_exercise"
    t.boolean  "other_exercise"
    t.string   "project"
    t.string   "final_project"
    t.string   "course"
    t.boolean  "html_course"
    t.boolean  "css_course"
    t.boolean  "js_course"
    t.boolean  "ror_course"
    t.boolean  "other_course"
    t.boolean  "complete"
    t.boolean  "free"
    t.string   "location"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.string   "role"
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.string   "password_digest"
    t.string   "remember_digest"
    t.boolean  "admin",           default: false
    t.boolean  "usercreate"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree

  create_table "videos", force: :cascade do |t|
    t.string   "link"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "title"
  end

end
