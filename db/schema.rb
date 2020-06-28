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

ActiveRecord::Schema.define(version: 2020_06_25_102206) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "abilities", force: :cascade do |t|
    t.string "ability", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "ability_pokemons", force: :cascade do |t|
    t.bigint "ability_id"
    t.bigint "pokemon_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["ability_id", "pokemon_id"], name: "index_ability_pokemons_on_ability_id_and_pokemon_id", unique: true
    t.index ["ability_id"], name: "index_ability_pokemons_on_ability_id"
    t.index ["pokemon_id"], name: "index_ability_pokemons_on_pokemon_id"
  end

  create_table "pokemons", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "user_pokemons", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "pokemon_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["pokemon_id"], name: "index_user_pokemons_on_pokemon_id"
    t.index ["user_id", "pokemon_id"], name: "index_user_pokemons_on_user_id_and_pokemon_id", unique: true
    t.index ["user_id"], name: "index_user_pokemons_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name", null: false
    t.integer "age", null: false
    t.string "address", default: "内緒"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "ability_pokemons", "abilities"
  add_foreign_key "ability_pokemons", "pokemons"
  add_foreign_key "user_pokemons", "pokemons"
  add_foreign_key "user_pokemons", "users"
end
