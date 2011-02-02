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

ActiveRecord::Schema.define(:version => 20110202122608) do

  create_table "sessions", :force => true do |t|
    t.string   "session_id", :null => false
    t.text     "data"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "sessions", ["session_id"], :name => "index_sessions_on_session_id"
  add_index "sessions", ["updated_at"], :name => "index_sessions_on_updated_at"

  create_table "users", :force => true do |t|
    t.string   "email",                                  :default => "",        :null => false
    t.string   "encrypted_password",      :limit => 128, :default => "",        :null => false
    t.string   "password_salt",                          :default => "",        :null => false
    t.string   "reset_password_token"
    t.string   "remember_token"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "display_name"
    t.string   "username"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.string   "background_file_name"
    t.string   "background_content_type"
    t.integer  "background_file_size"
    t.boolean  "profile_public",                         :default => true
    t.string   "auth_type",                              :default => "sign_up"
    t.string   "fb_uid"
    t.string   "last_access_token"
    t.boolean  "all_values_valid",                       :default => true
    t.boolean  "signup_tracked",                         :default => false
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

  create_table "word_set_to_words", :force => true do |t|
    t.integer  "word_set_id"
    t.integer  "word_id"
    t.integer  "position"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "deleted_at"
  end

  create_table "word_sets", :force => true do |t|
    t.integer  "sender_id"
    t.integer  "receiver_id"
    t.string   "note"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "deleted_at"
    t.string   "reply"
  end

  create_table "words", :force => true do |t|
    t.string   "word"
    t.integer  "word_count"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "deleted_at"
  end

end
