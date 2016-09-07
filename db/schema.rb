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
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20160728220506) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "caught_pokemons", force: :cascade do |t|
    t.string   "username",     null: false
    t.integer  "combat_power", null: false
    t.integer  "pokemon_id",   null: false
    t.integer  "health_power", null: false
    t.string   "location",     null: false
    t.string   "team_color",   null: false
    t.string   "first_move",   null: false
    t.string   "second_move",  null: false
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "pokemon_name", null: false
  end

  create_table "pokemons", force: :cascade do |t|
    t.string "name",         null: false
    t.string "element_type", null: false
    t.string "img_src"
  end

  create_table "ranking_tables", force: :cascade do |t|
    t.integer "pokemon_limit", null: false
    t.string  "name",          null: false
  end

  create_table "uploaded_pokemons", force: :cascade do |t|
    t.string "image"
  end

end
