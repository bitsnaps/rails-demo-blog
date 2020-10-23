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

ActiveRecord::Schema.define(version: 20201023141214) do

  create_table "categories", force: true do |t|
    t.string  "name"
    t.string  "slug"
    t.integer "posts_count", default: 0
  end

  create_table "meta", force: true do |t|
    t.string  "name"
    t.integer "metatable_id"
    t.string  "metatable_type"
  end

  add_index "meta", ["metatable_id", "metatable_type"], name: "index_meta_on_metatable_id_and_metatable_type"

  create_table "posts", force: true do |t|
    t.string   "name"
    t.text     "content"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "slug"
    t.boolean  "online",      default: false
    t.integer  "category_id"
  end

  add_index "posts", ["category_id"], name: "index_posts_on_category_id"

  create_table "posts_tags", id: false, force: true do |t|
    t.integer "post_id", null: false
    t.integer "tag_id",  null: false
  end

  add_index "posts_tags", ["post_id", "tag_id"], name: "index_posts_tags_on_post_id_and_tag_id"
  add_index "posts_tags", ["tag_id", "post_id"], name: "index_posts_tags_on_tag_id_and_post_id"

  create_table "tags", force: true do |t|
    t.string "name"
  end

end
