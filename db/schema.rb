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

ActiveRecord::Schema.define(version: 2018_05_09_082619) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "app_settings", force: :cascade do |t|
    t.string "name", limit: 40, null: false
    t.string "value"
    t.text "description"
    t.boolean "is_active", default: true, null: false
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["deleted_at"], name: "index_app_settings_on_deleted_at"
    t.index ["name"], name: "index_app_settings_on_name", where: "(deleted_at IS NULL)"
  end

  create_table "games", force: :cascade do |t|
    t.string "title", limit: 100, null: false
    t.integer "width"
    t.integer "height"
    t.binary "gamedata"
    t.boolean "is_active", default: true, null: false
    t.datetime "deleted_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["deleted_at"], name: "index_games_on_deleted_at"
    t.index ["title"], name: "index_games_on_title", where: "(deleted_at IS NULL)"
  end

end
