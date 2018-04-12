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

ActiveRecord::Schema.define(version: 20180412131451) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

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

