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

ActiveRecord::Schema.define(version: 20160911050822) do

  create_table "items", force: :cascade do |t|
    t.string   "name"
    t.string   "description"
    t.integer  "durability"
    t.string   "damage_small"
    t.string   "damage_large"
    t.integer  "armor"
    t.integer  "strength"
    t.integer  "agility"
    t.integer  "intelligence"
    t.integer  "regen"
    t.integer  "spellshield"
    t.integer  "accuracy"
    t.integer  "critical"
    t.integer  "hp"
    t.integer  "mp"
    t.integer  "level_required"
    t.string   "job_required"
    t.boolean  "repairable"
    t.boolean  "drops_on_death"
    t.boolean  "breaks_on_death"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

  create_table "microposts", force: :cascade do |t|
    t.text     "content"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "picture"
    t.index ["user_id", "created_at"], name: "index_microposts_on_user_id_and_created_at"
    t.index ["user_id"], name: "index_microposts_on_user_id"
  end

  create_table "monster_drops", force: :cascade do |t|
    t.integer  "monster_id"
    t.integer  "item_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["item_id"], name: "index_monster_drops_on_item_id"
    t.index ["monster_id", "item_id"], name: "index_monster_drops_on_monster_id_and_item_id", unique: true
    t.index ["monster_id"], name: "index_monster_drops_on_monster_id"
  end

  create_table "monsters", force: :cascade do |t|
    t.string   "name"
    t.integer  "exp"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.decimal  "hp"
    t.decimal  "mp"
    t.decimal  "attack_damage"
  end

  create_table "relationships", force: :cascade do |t|
    t.integer  "follower_id"
    t.integer  "followed_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at",                        null: false
    t.datetime "updated_at",                        null: false
    t.string   "password_digest"
    t.string   "remember_digest"
    t.boolean  "admin",             default: false
    t.string   "activation_digest"
    t.boolean  "activated",         default: false
    t.datetime "activated_at"
    t.string   "reset_digest"
    t.datetime "reset_sent_at"
    t.index ["email"], name: "index_users_on_email", unique: true
  end

end
