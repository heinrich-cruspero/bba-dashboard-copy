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

ActiveRecord::Schema.define(version: 20171011151952) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "amazon_data", force: :cascade do |t|
    t.bigint "book_id"
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
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["ean"], name: "index_books_on_ean", unique: true
    t.index ["isbn"], name: "index_books_on_isbn", unique: true
  end

  create_table "guide_data", force: :cascade do |t|
    t.bigint "book_id"
    t.float "list_price", default: 0.0, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["book_id"], name: "index_guide_data_on_book_id", unique: true
  end

  create_table "indaba_data", force: :cascade do |t|
    t.bigint "book_id"
    t.float "bbap", default: 0.0, null: false
    t.float "direct", default: 0.0, null: false
    t.integer "tqs", default: 0, null: false
    t.integer "weekly_sqad", default: 0, null: false
    t.integer "weekly_sqmd", default: 0, null: false
    t.float "past_day_sales_history_lowest_price", default: 0.0, null: false
    t.float "past_day_sales_history_highest_price", default: 0.0, null: false
    t.float "past_week_sales_history_lowest_price", default: 0.0, null: false
    t.float "past_week_sales_history_highest_price", default: 0.0, null: false
    t.float "past_month_sales_history_lowest_price", default: 0.0, null: false
    t.float "past_month_sales_history_highest_price", default: 0.0, null: false
    t.string "first_lowest_price_indaba_name", null: false
    t.float "first_lowest_price_indaba_lowest_price", default: 0.0, null: false
    t.integer "first_lowest_price_indaba_quantity_online", default: 0, null: false
    t.string "second_lowest_price_indaba_name", null: false
    t.float "second_lowest_price_indaba_lowest_price", default: 0.0, null: false
    t.integer "second_lowest_price_indaba_quantity_online", default: 0, null: false
    t.string "third_lowest_price_indaba_name", null: false
    t.float "third_lowest_price_indaba_lowest_price", default: 0.0, null: false
    t.integer "third_lowest_price_indaba_quantity_online", default: 0, null: false
    t.string "forth_lowest_price_indaba_name", null: false
    t.float "forth_lowest_price_indaba_lowest_price", default: 0.0, null: false
    t.integer "forth_lowest_price_indaba_quantity_online", default: 0, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["book_id"], name: "index_indaba_data_on_book_id", unique: true
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
    t.boolean "admin", default: true, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "want_list_items", force: :cascade do |t|
    t.bigint "want_list_id", null: false
    t.string "ean", null: false
    t.integer "quantity", default: 0, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["ean"], name: "index_want_list_items_on_ean"
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
    t.index ["name"], name: "index_want_lists_on_name"
    t.index ["user_id"], name: "index_want_lists_on_user_id"
    t.index ["want_list_privacy_id"], name: "index_want_lists_on_want_list_privacy_id"
  end

  add_foreign_key "amazon_data", "books"
  add_foreign_key "guide_data", "books"
  add_foreign_key "indaba_data", "books"
  add_foreign_key "want_list_items", "want_lists"
  add_foreign_key "want_lists", "users"
  add_foreign_key "want_lists", "want_list_privacies"
end
