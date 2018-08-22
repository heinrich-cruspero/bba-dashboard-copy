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

ActiveRecord::Schema.define(version: 20180822133300) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "abe_accounts", force: :cascade do |t|
    t.string "email"
    t.string "client_key"
    t.string "access_key"
    t.string "secret_key"
    t.string "cc_token"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "vendor_ids"
    t.integer "media_partner_id"
  end

  create_table "abe_listings", force: :cascade do |t|
    t.bigint "abe_order_id", null: false
    t.bigint "listing_id", null: false
    t.integer "quantity", null: false
    t.string "title", null: false
    t.string "isbn", null: false
    t.integer "vendor_id", null: false
    t.integer "min_shipping_days", null: false
    t.integer "max_shipping_days", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["abe_order_id"], name: "index_abe_listings_on_abe_order_id"
    t.index ["isbn"], name: "index_abe_listings_on_isbn"
    t.index ["listing_id"], name: "index_abe_listings_on_listing_id"
    t.index ["vendor_id"], name: "index_abe_listings_on_vendor_id"
  end

  create_table "abe_order_items", force: :cascade do |t|
    t.bigint "abe_listing_id", null: false
    t.bigint "abe_order_id", null: false
    t.float "cost", null: false
    t.float "shipcost", null: false
    t.integer "status", null: false
    t.integer "order_item_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["abe_listing_id"], name: "index_abe_order_items_on_abe_listing_id"
    t.index ["abe_order_id"], name: "index_abe_order_items_on_abe_order_id"
    t.index ["order_item_id"], name: "index_abe_order_items_on_order_item_id"
    t.index ["status"], name: "index_abe_order_items_on_status"
  end

  create_table "abe_orders", force: :cascade do |t|
    t.string "order_id", null: false
    t.boolean "dryrun", null: false
    t.string "reference_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["dryrun"], name: "index_abe_orders_on_dryrun"
    t.index ["order_id"], name: "index_abe_orders_on_order_id"
    t.index ["reference_id"], name: "index_abe_orders_on_reference_id"
  end

  create_table "accounts", force: :cascade do |t|
    t.bigint "source_id", null: false
    t.string "name", null: false
    t.string "account_number", null: false
    t.string "address_ln1", null: false
    t.string "address_ln2"
    t.string "city", null: false
    t.string "state", null: false
    t.string "zip", null: false
    t.string "phone_number"
    t.string "extension"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["account_number"], name: "index_accounts_on_account_number"
    t.index ["address_ln1"], name: "index_accounts_on_address_ln1"
    t.index ["city"], name: "index_accounts_on_city"
    t.index ["name"], name: "index_accounts_on_name"
    t.index ["phone_number"], name: "index_accounts_on_phone_number"
    t.index ["source_id", "name"], name: "index_accounts_on_source_id_and_name", unique: true
    t.index ["source_id"], name: "index_accounts_on_source_id"
    t.index ["state"], name: "index_accounts_on_state"
    t.index ["zip"], name: "index_accounts_on_zip"
  end

  create_table "amazon_data", force: :cascade do |t|
    t.bigint "book_id", null: false
    t.float "lowest_fba", default: 0.0, null: false
    t.float "lowest_good_price", default: 0.0, null: false
    t.integer "sales_rank", default: 0, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["book_id"], name: "index_amazon_data_on_book_id", unique: true
  end

  create_table "books", force: :cascade do |t|
    t.string "ean", null: false
    t.string "isbn", null: false
    t.string "author", null: false
    t.string "title", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.date "publication_date"
    t.string "publisher"
    t.string "edition"
    t.index ["author"], name: "index_books_on_author"
    t.index ["ean"], name: "index_books_on_ean", unique: true
    t.index ["isbn"], name: "index_books_on_isbn", unique: true
    t.index ["title"], name: "index_books_on_title"
  end

  create_table "custom_isbns", force: :cascade do |t|
    t.string "text_isbn"
    t.string "alt_isbn"
    t.string "custom_isbn"
    t.string "code_isbn"
    t.string "tag"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["alt_isbn"], name: "index_custom_isbns_on_alt_isbn"
    t.index ["code_isbn"], name: "index_custom_isbns_on_code_isbn"
    t.index ["custom_isbn"], name: "index_custom_isbns_on_custom_isbn"
    t.index ["tag"], name: "index_custom_isbns_on_tag"
    t.index ["text_isbn"], name: "index_custom_isbns_on_text_isbn"
  end

  create_table "guide_data", force: :cascade do |t|
    t.bigint "book_id", null: false
    t.float "list_price", default: 0.0, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["book_id"], name: "index_guide_data_on_book_id", unique: true
  end

  create_table "indaba_data", force: :cascade do |t|
    t.bigint "book_id", null: false
    t.float "bbap", default: 0.0, null: false
    t.float "direct", default: 0.0, null: false
    t.integer "tqs", default: 0, null: false
    t.integer "weekly_sqad", default: 0, null: false
    t.integer "weekly_sqmd", default: 0, null: false
    t.integer "daily_sqaa", default: 0, null: false
    t.integer "weekly_sqaa", default: 0, null: false
    t.integer "monthly_sqaa", default: 0, null: false
    t.integer "yearly_sqaa", default: 0, null: false
    t.integer "daily_rqf", default: 0, null: false
    t.integer "weekly_rqf", default: 0, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.float "w_nw", default: 0.0, null: false
    t.float "whole_sale", default: 0.0, null: false
    t.integer "daily_sqad", default: 0, null: false
    t.integer "monthly_sqad", default: 0, null: false
    t.integer "yearly_sqad", default: 0, null: false
    t.index ["book_id"], name: "index_indaba_data_on_book_id", unique: true
  end

  create_table "indaba_instance_data", force: :cascade do |t|
    t.bigint "indaba_instance_id", null: false
    t.bigint "book_id", null: false
    t.integer "quantity_online", default: 0, null: false
    t.float "lowest_price", default: 0.0, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "total_quantity", default: 0, null: false
    t.integer "tqs"
    t.index ["book_id"], name: "index_indaba_instance_data_on_book_id"
    t.index ["indaba_instance_id", "book_id"], name: "index_indaba_instance_data_on_indaba_instance_id_and_book_id", unique: true
    t.index ["indaba_instance_id"], name: "index_indaba_instance_data_on_indaba_instance_id"
  end

  create_table "indaba_instances", force: :cascade do |t|
    t.string "database_name", null: false
    t.string "account_name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["account_name"], name: "index_indaba_instances_on_account_name", unique: true
    t.index ["database_name"], name: "index_indaba_instances_on_database_name", unique: true
  end

  create_table "indaba_orders", force: :cascade do |t|
    t.bigint "book_id", null: false
    t.bigint "indaba_instance_id", null: false
    t.float "price_paid", default: 0.0, null: false
    t.string "market_name", null: false
    t.string "buyer_email"
    t.string "market_book_order_id", null: false
    t.datetime "date_ordered", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["book_id"], name: "index_indaba_orders_on_book_id"
    t.index ["buyer_email"], name: "index_indaba_orders_on_buyer_email"
    t.index ["date_ordered"], name: "index_indaba_orders_on_date_ordered"
    t.index ["indaba_instance_id", "market_book_order_id"], name: "index_indaba_orders_on_indaba_instance_and_market_book_order", unique: true
    t.index ["indaba_instance_id"], name: "index_indaba_orders_on_indaba_instance_id"
    t.index ["market_book_order_id"], name: "index_indaba_orders_on_market_book_order_id"
    t.index ["market_name"], name: "index_indaba_orders_on_market_name"
  end

  create_table "source_types", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_source_types_on_name", unique: true
  end

  create_table "sources", force: :cascade do |t|
    t.bigint "source_type_id", null: false
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_sources_on_name"
    t.index ["source_type_id", "name"], name: "index_sources_on_source_type_id_and_name", unique: true
    t.index ["source_type_id"], name: "index_sources_on_source_type_id"
  end

  create_table "tmp_indaba_data", id: false, force: :cascade do |t|
    t.bigint "book_id", null: false
    t.bigint "indaba_instance_id", null: false
    t.integer "tqs", default: 0, null: false
    t.integer "total_quantity", default: 0, null: false
    t.integer "quantity_online", default: 0, null: false
    t.float "lowest_price", default: 0.0, null: false
    t.float "list_price", default: 0.0, null: false
    t.float "lowest_good_price", default: 0.0, null: false
    t.float "lowest_fba", default: 0.0, null: false
    t.integer "sales_rank", default: 0, null: false
    t.float "bbap", default: 0.0, null: false
    t.float "direct", default: 0.0, null: false
    t.float "w_nw", default: 0.0, null: false
    t.float "whole_sale", default: 0.0, null: false
    t.index ["book_id"], name: "index_tmp_indaba_data_on_book_id"
    t.index ["indaba_instance_id"], name: "index_tmp_indaba_data_on_indaba_instance_id"
  end

  create_table "tracked_skus", force: :cascade do |t|
    t.string "asin"
    t.string "isbn"
    t.date "publication_date"
    t.string "title"
    t.string "author"
    t.string "publisher"
    t.string "binding"
    t.string "condition"
    t.string "location"
    t.string "sku"
    t.string "locator_code"
    t.string "suffix"
    t.datetime "date_created"
    t.string "internal_price_4"
    t.string "internal_notes_1"
    t.string "internal_notes_2"
    t.string "internal_notes_3"
    t.boolean "audited"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.boolean "admin", default: false, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "users_want_lists", id: false, force: :cascade do |t|
    t.bigint "want_list_id", null: false
    t.bigint "user_id", null: false
    t.index ["user_id"], name: "index_users_want_lists_on_user_id"
    t.index ["want_list_id", "user_id"], name: "index_users_want_lists_on_want_list_id_and_user_id", unique: true
    t.index ["want_list_id"], name: "index_users_want_lists_on_want_list_id"
  end

  create_table "valore_accounts", force: :cascade do |t|
    t.string "name"
    t.string "buyer_id"
    t.string "access_key_id"
    t.string "secret_access_key"
    t.string "queue_url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "valore_orders", force: :cascade do |t|
    t.integer "order_id"
    t.integer "item_id"
    t.string "isbn"
    t.float "price"
    t.datetime "quote_date"
    t.string "status"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "valore_account_id"
    t.index ["valore_account_id"], name: "index_valore_orders_on_valore_account_id"
  end

  create_table "want_list_items", force: :cascade do |t|
    t.bigint "want_list_id", null: false
    t.string "ean", null: false
    t.integer "quantity", default: 0, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.float "max_price", default: 0.0, null: false
    t.integer "quantity_purchased", default: 0, null: false
    t.datetime "expiration_date"
    t.float "valore_suggested_price", default: 0.0, null: false
    t.index ["ean"], name: "index_want_list_items_on_ean"
    t.index ["want_list_id", "ean"], name: "index_want_list_items_on_want_list_id_and_ean", unique: true
    t.index ["want_list_id"], name: "index_want_list_items_on_want_list_id"
  end

  create_table "want_list_privacies", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_want_list_privacies_on_name", unique: true
  end

  create_table "want_lists", force: :cascade do |t|
    t.string "name", null: false
    t.bigint "user_id", null: false
    t.bigint "want_list_privacy_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "active"
    t.bigint "valore_account_id"
    t.string "upload_status"
    t.bigint "abe_account_id"
    t.index ["abe_account_id"], name: "index_want_lists_on_abe_account_id"
    t.index ["name"], name: "index_want_lists_on_name"
    t.index ["user_id"], name: "index_want_lists_on_user_id"
    t.index ["valore_account_id"], name: "index_want_lists_on_valore_account_id"
    t.index ["want_list_privacy_id"], name: "index_want_lists_on_want_list_privacy_id"
  end

  add_foreign_key "abe_listings", "abe_orders"
  add_foreign_key "abe_order_items", "abe_listings"
  add_foreign_key "abe_order_items", "abe_orders"
  add_foreign_key "accounts", "sources"
  add_foreign_key "amazon_data", "books"
  add_foreign_key "guide_data", "books"
  add_foreign_key "indaba_data", "books"
  add_foreign_key "indaba_instance_data", "books"
  add_foreign_key "indaba_instance_data", "indaba_instances"
  add_foreign_key "indaba_orders", "books"
  add_foreign_key "indaba_orders", "indaba_instances"
  add_foreign_key "sources", "source_types"
  add_foreign_key "users_want_lists", "users"
  add_foreign_key "users_want_lists", "want_lists"
  add_foreign_key "valore_orders", "valore_accounts"
  add_foreign_key "want_list_items", "want_lists"
  add_foreign_key "want_lists", "abe_accounts"
  add_foreign_key "want_lists", "users"
  add_foreign_key "want_lists", "valore_accounts"
  add_foreign_key "want_lists", "want_list_privacies"
end
