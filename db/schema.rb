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

ActiveRecord::Schema.define(:version => 20120203172116) do

  create_table "addresses", :force => true do |t|
    t.integer  "tenant_id",                                          :null => false
    t.string   "address_1",                                          :null => false
    t.string   "address_2"
    t.string   "city",                                               :null => false
    t.string   "state",                                              :null => false
    t.string   "postal",                                             :null => false
    t.string   "country",    :default => "United States of America"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "addresses", ["address_1", "state"], :name => "index_addresses_on_address_1_and_state"
  add_index "addresses", ["tenant_id"], :name => "index_addresses_on_tenant_id"

  create_table "id_card_numbers", :force => true do |t|
    t.integer  "tenant_id",  :null => false
    t.string   "state",      :null => false
    t.string   "type",       :null => false
    t.string   "number",     :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "id_card_numbers", ["tenant_id", "state", "type", "number"], :name => "index_id_card_numbers_on_tenant_id_and_state_and_type_and_number", :unique => true
  add_index "id_card_numbers", ["tenant_id"], :name => "index_id_card_numbers_on_tenant_id"

  create_table "properties", :force => true do |t|
    t.integer  "user_id",    :null => false
    t.string   "name",       :null => false
    t.string   "code"
    t.string   "address"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "properties", ["user_id", "code"], :name => "index_properties_on_user_id_and_code", :unique => true
  add_index "properties", ["user_id", "name"], :name => "index_properties_on_user_id_and_name", :unique => true
  add_index "properties", ["user_id"], :name => "index_properties_on_user_id"

  create_table "ratings", :force => true do |t|
    t.integer  "user_id",                               :null => false
    t.integer  "tenant_id",                             :null => false
    t.integer  "property_id",                           :null => false
    t.date     "rental_start"
    t.date     "rental_end"
    t.boolean  "pay_on_time",        :default => true,  :null => false
    t.boolean  "pets",               :default => false, :null => false
    t.boolean  "followed_rules",     :default => true,  :null => false
    t.boolean  "gave_proper_notice", :default => true,  :null => false
    t.boolean  "leave_on_time",      :default => true,  :null => false
    t.boolean  "owe_money",          :default => true,  :null => false
    t.integer  "overall_rating"
    t.boolean  "deposits_returned"
    t.boolean  "smoking"
    t.boolean  "evicted"
    t.boolean  "would_rent_again"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "telephone_numbers", :force => true do |t|
    t.integer  "tenant_id",  :null => false
    t.string   "number",     :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "telephone_numbers", ["number"], :name => "index_telephone_numbers_on_number"
  add_index "telephone_numbers", ["tenant_id"], :name => "index_telephone_numbers_on_tenant_id"

  create_table "tenants", :force => true do |t|
    t.string   "first_name",     :null => false
    t.string   "last_name",      :null => false
    t.string   "ssn_last_fours"
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
  end

  add_index "users", ["login"], :name => "index_users_on_login", :unique => true

end