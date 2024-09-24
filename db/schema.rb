# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2024_09_24_073159) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "author_books", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "author_id", null: false
    t.uuid "book_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["author_id"], name: "index_author_books_on_author_id"
    t.index ["book_id"], name: "index_author_books_on_book_id"
    t.index ["created_at"], name: "index_author_books_on_created_at"
  end

  create_table "authors", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "first_name", null: false
    t.string "middle_name"
    t.string "last_name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["created_at"], name: "index_authors_on_created_at"
  end

  create_table "books", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "title", null: false
    t.string "isbn_13", null: false
    t.string "isbn_10"
    t.decimal "price", precision: 10, scale: 2, null: false
    t.integer "publication_year", null: false
    t.string "edition"
    t.string "image_url"
    t.uuid "publisher_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["created_at"], name: "index_books_on_created_at"
    t.index ["publisher_id"], name: "index_books_on_publisher_id"
  end

  create_table "publishers", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["created_at"], name: "index_publishers_on_created_at"
  end

  add_foreign_key "author_books", "authors"
  add_foreign_key "author_books", "books"
  add_foreign_key "books", "publishers"
end
