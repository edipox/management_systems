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

ActiveRecord::Schema.define(:version => 20121113063217) do

  create_table "acl_actions", :force => true do |t|
    t.string   "name"
    t.string   "symbol"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "acl_entities", :force => true do |t|
    t.string   "name"
    t.string   "const"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "acl_permissions", :force => true do |t|
    t.string   "role_id"
    t.string   "entity_id"
    t.string   "action_id"
    t.boolean  "enabled"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "acl_roles", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "app_configs", :force => true do |t|
    t.string   "value"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "components_brands", :force => true do |t|
    t.string   "name"
    t.string   "description"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "components_categories", :force => true do |t|
    t.string   "name"
    t.string   "description"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "components_categories_kinds", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "components_items", :force => true do |t|
    t.string   "name"
    t.string   "description"
    t.string   "code"
    t.string   "category_id",      :limit => 36, :null => false
    t.string   "brand_id",         :limit => 36, :null => false
    t.integer  "minimum_quantity"
    t.integer  "price"
    t.datetime "created_at",                     :null => false
    t.datetime "updated_at",                     :null => false
  end

  create_table "locations_cities", :force => true do |t|
    t.string   "name"
    t.integer  "region_id_id"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  add_index "locations_cities", ["region_id_id"], :name => "index_locations_cities_on_region_id_id"

  create_table "locations_continents", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "locations_countries", :force => true do |t|
    t.string   "name"
    t.integer  "continent_id_id"
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

  add_index "locations_countries", ["continent_id_id"], :name => "index_locations_countries_on_continent_id_id"

  create_table "locations_regions", :force => true do |t|
    t.string   "name"
    t.integer  "country_id_id"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  add_index "locations_regions", ["country_id_id"], :name => "index_locations_regions_on_country_id_id"

  create_table "orders_productions", :force => true do |t|
    t.string   "transaction_id"
    t.string   "status_id"
    t.string   "user_id"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  create_table "orders_productions_details", :force => true do |t|
    t.string   "product_id"
    t.string   "header_id"
    t.integer  "quantity"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "products_compositions", :force => true do |t|
    t.string   "name"
    t.string   "description"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  create_table "products_compositions_details", :force => true do |t|
    t.string   "component_id"
    t.string   "header_id"
    t.integer  "quantity"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  create_table "products_items", :force => true do |t|
    t.string   "name"
    t.string   "model_id"
    t.integer  "minimum_quantity"
    t.integer  "price"
    t.datetime "created_at",       :null => false
    t.datetime "updated_at",       :null => false
  end

  create_table "requests_devolutions_components", :force => true do |t|
    t.string   "transaction_id"
    t.string   "status_id"
    t.string   "user_id"
    t.string   "reason"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  create_table "requests_devolutions_components_details", :force => true do |t|
    t.string   "header_id"
    t.string   "component_id"
    t.integer  "quantity"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  create_table "requests_devolutions_products", :force => true do |t|
    t.string   "transaction_id"
    t.string   "user_id"
    t.string   "reason"
    t.string   "status_id"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  create_table "requests_devolutions_products_details", :force => true do |t|
    t.string   "header_id"
    t.string   "product_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "requests_purchases_components", :force => true do |t|
    t.string   "status_id"
    t.string   "user_id"
    t.string   "transaction_id"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  create_table "requests_purchases_components_details", :force => true do |t|
    t.string   "header_id"
    t.string   "component_id"
    t.integer  "quantity"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  create_table "requests_transferences_components", :force => true do |t|
    t.string   "status_id"
    t.string   "user_id"
    t.string   "transaction_id"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  create_table "requests_transferences_components_details", :force => true do |t|
    t.string   "header_id"
    t.string   "component_id"
    t.integer  "quantity"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  create_table "requests_transferences_products", :force => true do |t|
    t.string   "status_id"
    t.string   "transaction_id"
    t.string   "user_id"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
  end

  create_table "requests_transferences_products_details", :force => true do |t|
    t.string   "header_id"
    t.string   "product_id"
    t.integer  "quantity"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "stocks_components", :force => true do |t|
    t.string   "component_id"
    t.integer  "quantity"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  create_table "stocks_productions", :force => true do |t|
    t.string   "component_id"
    t.integer  "quantity"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  create_table "stocks_products", :force => true do |t|
    t.string   "product_id"
    t.integer  "quantity"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "stocks_transactions_components", :force => true do |t|
    t.string   "kind"
    t.string   "kind_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "stocks_transactions_productions", :force => true do |t|
    t.string   "kind"
    t.string   "kind_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "stocks_transactions_products", :force => true do |t|
    t.string   "kind"
    t.string   "kind_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "tests", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "transactions_statuses", :force => true do |t|
    t.string   "name"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "email",                                :default => "", :null => false
    t.string   "encrypted_password",                   :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                        :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                                           :null => false
    t.datetime "updated_at",                                           :null => false
    t.string   "acl_role_id",            :limit => 36
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

  create_table "versions", :force => true do |t|
    t.string   "item_type",                :null => false
    t.string   "item_id",    :limit => 36, :null => false
    t.string   "event",                    :null => false
    t.string   "whodunnit"
    t.text     "object"
    t.datetime "created_at"
  end

  add_index "versions", ["item_type", "item_id"], :name => "index_versions_on_item_type_and_item_id"

end
