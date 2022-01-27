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

ActiveRecord::Schema.define(version: 2022_01_26_234522) do

  create_table "action_text_rich_texts", force: :cascade do |t|
    t.string "name", null: false
    t.text "body"
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["record_type", "record_id", "name"], name: "index_action_text_rich_texts_uniqueness", unique: true
  end

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.integer "record_id", null: false
    t.integer "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.string "service_name", null: false
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.integer "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "comments", force: :cascade do |t|
    t.text "content"
    t.integer "task_id"
    t.integer "user_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["task_id"], name: "index_comments_on_task_id"
    t.index ["user_id"], name: "index_comments_on_user_id"
  end

  create_table "function_user_projects", force: :cascade do |t|
    t.integer "project_id"
    t.integer "user_id"
    t.integer "function_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["function_id"], name: "index_function_user_projects_on_function_id"
    t.index ["project_id"], name: "index_function_user_projects_on_project_id"
    t.index ["user_id"], name: "index_function_user_projects_on_user_id"
  end

  create_table "functions", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "images", force: :cascade do |t|
    t.text "image_data"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "kinds", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "notifications", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "actor_id"
    t.string "notify_type", null: false
    t.string "target_type"
    t.integer "target_id"
    t.string "second_target_type"
    t.integer "second_target_id"
    t.string "third_target_type"
    t.integer "third_target_id"
    t.datetime "read_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id", "notify_type"], name: "index_notifications_on_user_id_and_notify_type"
    t.index ["user_id"], name: "index_notifications_on_user_id"
  end

  create_table "participants", force: :cascade do |t|
    t.integer "user_id"
    t.integer "user_story_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_participants_on_user_id"
    t.index ["user_story_id"], name: "index_participants_on_user_story_id"
  end

  create_table "priorities", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "projects", force: :cascade do |t|
    t.string "name"
    t.string "initial"
    t.text "description"
    t.integer "size"
    t.string "difficulty"
    t.datetime "start_date"
    t.datetime "end_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "priority_id"
    t.index ["priority_id"], name: "index_projects_on_priority_id"
  end

  create_table "releases", force: :cascade do |t|
    t.string "version"
    t.date "deliver_date"
    t.integer "project_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["project_id"], name: "index_releases_on_project_id"
  end

  create_table "sprints", force: :cascade do |t|
    t.string "name"
    t.datetime "start_date"
    t.datetime "end_date"
    t.datetime "planning_start_date"
    t.datetime "planning_end_date"
    t.datetime "execution_start_date"
    t.datetime "execution_end_date"
    t.datetime "review_meeting_date"
    t.datetime "retrospective_meeting_date"
    t.string "sprint_status", default: "ATIVA"
    t.integer "project_id"
    t.integer "release_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["project_id"], name: "index_sprints_on_project_id"
    t.index ["release_id"], name: "index_sprints_on_release_id"
  end

  create_table "tasks", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.date "end_date"
    t.date "start_date"
    t.integer "status"
    t.boolean "impediment"
    t.integer "user_story_id"
    t.integer "kind_id"
    t.integer "priority_id"
    t.integer "function_user_project_id"
    t.integer "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["function_user_project_id"], name: "index_tasks_on_function_user_project_id"
    t.index ["kind_id"], name: "index_tasks_on_kind_id"
    t.index ["priority_id"], name: "index_tasks_on_priority_id"
    t.index ["user_id"], name: "index_tasks_on_user_id"
    t.index ["user_story_id"], name: "index_tasks_on_user_story_id"
  end

  create_table "tasks_users", force: :cascade do |t|
    t.integer "user_id"
    t.integer "task_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["task_id"], name: "index_tasks_users_on_task_id"
    t.index ["user_id"], name: "index_tasks_users_on_user_id"
  end

  create_table "themes", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "project_id"
    t.index ["project_id"], name: "index_themes_on_project_id"
  end

  create_table "user_stories", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.integer "business_value"
    t.integer "story_points"
    t.integer "status"
    t.integer "theme_id"
    t.integer "sprint_id"
    t.integer "priority_id"
    t.integer "project_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["priority_id"], name: "index_user_stories_on_priority_id"
    t.index ["project_id"], name: "index_user_stories_on_project_id"
    t.index ["sprint_id"], name: "index_user_stories_on_sprint_id"
    t.index ["theme_id"], name: "index_user_stories_on_theme_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string "current_sign_in_ip"
    t.string "last_sign_in_ip"
    t.string "name"
    t.integer "group"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "users_tasks", force: :cascade do |t|
    t.integer "user_id"
    t.integer "task_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["task_id"], name: "index_users_tasks_on_task_id"
    t.index ["user_id"], name: "index_users_tasks_on_user_id"
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "comments", "tasks"
  add_foreign_key "comments", "users"
  add_foreign_key "function_user_projects", "functions"
  add_foreign_key "function_user_projects", "projects"
  add_foreign_key "function_user_projects", "users"
  add_foreign_key "participants", "user_stories"
  add_foreign_key "participants", "users"
  add_foreign_key "projects", "priorities"
  add_foreign_key "releases", "projects"
  add_foreign_key "sprints", "projects"
  add_foreign_key "sprints", "releases"
  add_foreign_key "tasks", "function_user_projects"
  add_foreign_key "tasks", "kinds"
  add_foreign_key "tasks", "priorities"
  add_foreign_key "tasks", "user_stories"
  add_foreign_key "tasks", "users"
  add_foreign_key "tasks_users", "tasks"
  add_foreign_key "tasks_users", "users"
  add_foreign_key "themes", "projects"
  add_foreign_key "user_stories", "priorities"
  add_foreign_key "user_stories", "projects"
  add_foreign_key "user_stories", "sprints"
  add_foreign_key "user_stories", "themes"
  add_foreign_key "users_tasks", "tasks"
  add_foreign_key "users_tasks", "users"
end
