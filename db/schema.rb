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

ActiveRecord::Schema[7.0].define(version: 2023_10_10_212936) do
  create_table "active_storage_attachments", charset: "utf8mb4", collation: "utf8mb4_0900_bin", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", charset: "utf8mb4", collation: "utf8mb4_0900_bin", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.string "service_name", null: false
    t.bigint "byte_size", null: false
    t.string "checksum"
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", charset: "utf8mb4", collation: "utf8mb4_0900_bin", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "activities", charset: "utf8mb4", collation: "utf8mb4_0900_bin", force: :cascade do |t|
    t.string "name"
    t.string "description", limit: 2000
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "camp_id", null: false
    t.integer "start_year"
    t.integer "start_month"
    t.integer "start_date"
    t.integer "end_year"
    t.integer "end_month"
    t.integer "end_date"
    t.integer "age_group_min"
    t.integer "age_group_max"
    t.integer "base_price"
    t.integer "discount_price"
    t.date "start_at"
    t.date "end_at"
    t.time "start_time"
    t.time "end_time"
    t.index ["camp_id"], name: "index_activities_on_camp_id"
  end

  create_table "camp_tag_relations", charset: "utf8mb4", collation: "utf8mb4_0900_bin", force: :cascade do |t|
    t.bigint "camp_id", null: false
    t.bigint "tag_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["camp_id"], name: "index_camp_tag_relations_on_camp_id"
    t.index ["tag_id"], name: "index_camp_tag_relations_on_tag_id"
  end

  create_table "camps", charset: "utf8mb4", collation: "utf8mb4_0900_bin", force: :cascade do |t|
    t.string "name"
    t.string "description", limit: 2000
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "organization_id", null: false
    t.integer "age_group_min"
    t.integer "age_group_max"
    t.integer "base_price"
    t.integer "discount_price"
    t.integer "minimum_discount_week"
    t.string "subhead", limit: 500
    t.string "website"
    t.integer "phone"
    t.string "email"
    t.integer "camp_type"
    t.integer "required_minimum_session"
    t.integer "zip_code"
    t.string "country"
    t.string "state"
    t.string "city"
    t.integer "region"
    t.integer "camp_group"
    t.time "start_time"
    t.time "end_time"
    t.index ["organization_id"], name: "index_camps_on_organization_id"
  end

  create_table "categories", charset: "utf8mb4", collation: "utf8mb4_0900_bin", force: :cascade do |t|
    t.bigint "activity_id", null: false
    t.bigint "tag_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["activity_id"], name: "index_categories_on_activity_id"
    t.index ["tag_id"], name: "index_categories_on_tag_id"
  end

  create_table "favorite_organizations", charset: "utf8mb4", collation: "utf8mb4_0900_bin", force: :cascade do |t|
    t.bigint "profile_id", null: false
    t.bigint "organization_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["organization_id"], name: "index_favorite_organizations_on_organization_id"
    t.index ["profile_id"], name: "index_favorite_organizations_on_profile_id"
  end

  create_table "organizations", charset: "utf8mb4", collation: "utf8mb4_0900_bin", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "zip_code"
    t.string "country"
    t.string "state"
    t.string "city"
    t.string "website"
    t.integer "phone"
    t.string "email"
    t.integer "age_group_min"
    t.integer "age_group_max"
    t.integer "region"
    t.integer "organization_type"
    t.boolean "approved", default: false, null: false
  end

  create_table "profiles", charset: "utf8mb4", collation: "utf8mb4_0900_bin", force: :cascade do |t|
    t.integer "role"
    t.string "first_name"
    t.string "last_name"
    t.integer "zip_code"
    t.string "country"
    t.string "state"
    t.string "city"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "user_id"
    t.index ["user_id"], name: "index_profiles_on_user_id"
  end

  create_table "schedule_activities", charset: "utf8mb4", collation: "utf8mb4_0900_bin", force: :cascade do |t|
    t.bigint "profile_id", null: false
    t.bigint "activity_id", null: false
    t.integer "state"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["activity_id"], name: "index_schedule_activities_on_activity_id"
    t.index ["profile_id"], name: "index_schedule_activities_on_profile_id"
  end

  create_table "tags", charset: "utf8mb4", collation: "utf8mb4_0900_bin", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", charset: "utf8mb4", collation: "utf8mb4_0900_bin", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "activities", "camps"
  add_foreign_key "camp_tag_relations", "camps"
  add_foreign_key "camp_tag_relations", "tags"
  add_foreign_key "categories", "activities"
  add_foreign_key "categories", "tags"
  add_foreign_key "favorite_organizations", "organizations"
  add_foreign_key "favorite_organizations", "profiles"
  add_foreign_key "profiles", "users"
  add_foreign_key "schedule_activities", "activities"
  add_foreign_key "schedule_activities", "profiles"
end
