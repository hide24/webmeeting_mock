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

ActiveRecord::Schema.define(version: 2022_10_02_082804) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "external_services", force: :cascade do |t|
    t.string "service_name"
    t.boolean "enabled"
    t.text "extras"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "meetings", force: :cascade do |t|
    t.integer "external_service_id"
    t.string "title"
    t.text "description"
    t.datetime "start_at"
    t.datetime "end_at"
    t.text "extras"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.text "user_ids"
  end

  create_table "users", force: :cascade do |t|
    t.string "display_name"
    t.string "given_name"
    t.string "surname"
    t.string "mail"
    t.boolean "guest"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users_external_services", force: :cascade do |t|
    t.integer "user_id"
    t.integer "external_service_id"
    t.string "external_mail"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

end