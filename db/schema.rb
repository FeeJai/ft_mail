# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_03_05_063841) do

  create_table "compartments", force: :cascade do |t|
    t.boolean "active", default: false, null: false
    t.string "name"
    t.date "returndate"
  end

  create_table "snailmails", force: :cascade do |t|
    t.integer "user_id"
    t.integer "compartment_id"
    t.datetime "received_at"
    t.index ["compartment_id"], name: "index_snailmails_on_compartment_id"
    t.index ["user_id"], name: "index_snailmails_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "email"
    t.integer "uid"
    t.integer "virtual_room"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.boolean "admin", default: false, null: false
  end

  add_foreign_key "snailmails", "compartments"
  add_foreign_key "snailmails", "users"
end
