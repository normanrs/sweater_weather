ActiveRecord::Schema.define(version: 2019_01_06_204348) do

  enable_extension "plpgsql"

  create_table "favorites", force: :cascade do |t|
    t.bigint "user_id"
    t.string "location"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_favorites_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email"
    t.string "password_digest"
    t.string "api_key"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "favorites", "users"
end
