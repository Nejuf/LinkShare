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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20131017232152) do

  create_table "comments", :force => true do |t|
    t.integer  "parent_comment_id"
    t.integer  "link_id",           :null => false
    t.string   "body",              :null => false
    t.integer  "user_id",           :null => false
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
  end

  add_index "comments", ["link_id"], :name => "index_comments_on_link_id"
  add_index "comments", ["parent_comment_id"], :name => "index_comments_on_parent_comment_id"
  add_index "comments", ["user_id"], :name => "index_comments_on_user_id"

  create_table "link_subs", :force => true do |t|
    t.integer  "link_id",    :null => false
    t.integer  "sub_id",     :null => false
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "link_subs", ["link_id", "sub_id"], :name => "index_link_subs_on_link_id_and_sub_id", :unique => true

  create_table "links", :force => true do |t|
    t.integer  "user_id",    :null => false
    t.string   "title",      :null => false
    t.string   "url",        :null => false
    t.text     "body"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "links", ["user_id"], :name => "index_links_on_user_id"

  create_table "subs", :force => true do |t|
    t.string   "name",       :null => false
    t.integer  "mod_id",     :null => false
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "subs", ["mod_id"], :name => "index_subs_on_mod_id"

  create_table "users", :force => true do |t|
    t.string   "username",        :null => false
    t.string   "password_digest", :null => false
    t.string   "session_token"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

end
