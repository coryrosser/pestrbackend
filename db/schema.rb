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

ActiveRecord::Schema.define(version: 2020_07_24_202549) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "groupmembers", force: :cascade do |t|
    t.bigint "group_id", null: false
    t.bigint "user_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["group_id"], name: "index_groupmembers_on_group_id"
    t.index ["user_id"], name: "index_groupmembers_on_user_id"
  end

  create_table "groups", force: :cascade do |t|
    t.string "name"
    t.bigint "user_id", null: false
    t.string "group_code"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_groups_on_user_id"
  end

  create_table "issues", force: :cascade do |t|
    t.string "title"
    t.string "description"
    t.integer "urgency"
    t.integer "status"
    t.bigint "group_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "creator_id"
    t.bigint "assigned_user_id"
    t.index ["assigned_user_id"], name: "index_issues_on_assigned_user_id"
    t.index ["creator_id"], name: "index_issues_on_creator_id"
    t.index ["group_id"], name: "index_issues_on_group_id"
  end

  create_table "updates", force: :cascade do |t|
    t.bigint "issue_id", null: false
    t.bigint "user_id", null: false
    t.string "content"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["issue_id"], name: "index_updates_on_issue_id"
    t.index ["user_id"], name: "index_updates_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.string "password_digest"
    t.string "email"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "groupmembers", "groups"
  add_foreign_key "groupmembers", "users"
  add_foreign_key "groups", "users"
  add_foreign_key "issues", "groups"
  add_foreign_key "issues", "users", column: "assigned_user_id"
  add_foreign_key "issues", "users", column: "creator_id"
  add_foreign_key "updates", "issues"
  add_foreign_key "updates", "users"
end
