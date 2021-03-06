# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20120203215347) do

  create_table "messages", :force => true do |t|
    t.integer  "from_user_id", :null => false
    t.integer  "to_user_id",   :null => false
    t.integer  "review_id",    :null => false
    t.integer  "message_id"
    t.text     "body",         :null => false
    t.datetime "read_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "messages", ["from_user_id"], :name => "index_messages_on_from_user_id"
  add_index "messages", ["to_user_id"], :name => "index_messages_on_to_user_id"

  create_table "properties", :force => true do |t|
    t.integer  "user_id",    :null => false
    t.string   "name",       :null => false
    t.string   "zip"
    t.string   "city"
    t.string   "state"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "properties", ["state"], :name => "index_properties_on_state"
  add_index "properties", ["user_id", "name"], :name => "index_properties_on_user_id_and_name", :unique => true
  add_index "properties", ["user_id"], :name => "index_properties_on_user_id"
  add_index "properties", ["zip"], :name => "index_properties_on_zip"

  create_table "ratings", :force => true do |t|
    t.integer  "property_id",                           :null => false
    t.string   "first_name",                            :null => false
    t.string   "last_name",                             :null => false
    t.integer  "rental_start_month"
    t.integer  "rental_start_year"
    t.integer  "rental_end_month"
    t.integer  "rental_end_year"
    t.string   "times_late_paying",                     :null => false
    t.string   "noise_complaints",                      :null => false
    t.string   "damage",                                :null => false
    t.boolean  "skipped_or_evicted", :default => false, :null => false
    t.string   "left_owing_money",                      :null => false
    t.boolean  "accepted_terms",     :default => true
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "login",                     :limit => 40
    t.string   "name",                      :limit => 100, :default => ""
    t.string   "email",                     :limit => 100
    t.string   "crypted_password",          :limit => 40
    t.string   "salt",                      :limit => 40
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "remember_token",            :limit => 40
    t.datetime "remember_token_expires_at"
    t.boolean  "admin",                                    :default => false
    t.string   "first_name",                                                  :null => false
    t.string   "last_name",                                                   :null => false
  end

  add_index "users", ["login"], :name => "index_users_on_login", :unique => true

end
