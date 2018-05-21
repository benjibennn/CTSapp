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

ActiveRecord::Schema.define(version: 20180519062559) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "attendance", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "present"
    t.bigint "classes_id"
    t.index ["classes_id"], name: "index_attendance_on_classes_id"
  end

  create_table "attends", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "date"
    t.boolean "present", default: false
    t.bigint "classes_id"
    t.bigint "student_id"
    t.bigint "subject_id"
    t.index ["classes_id"], name: "index_attends_on_classes_id"
    t.index ["student_id"], name: "index_attends_on_student_id"
    t.index ["subject_id"], name: "index_attends_on_subject_id"
  end

  create_table "classes", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "students_id"
    t.bigint "subjects_id"
    t.bigint "subject_id"
    t.index ["students_id"], name: "index_classes_on_students_id"
    t.index ["subject_id"], name: "index_classes_on_subject_id"
    t.index ["subjects_id"], name: "index_classes_on_subjects_id"
  end

  create_table "events", force: :cascade do |t|
    t.string "title"
    t.text "description"
    t.datetime "start_time"
    t.datetime "end_time"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "grades", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "scores"
    t.bigint "classes_id"
    t.index ["classes_id"], name: "index_grades_on_classes_id"
  end

  create_table "students", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "first_name"
    t.string "last_name"
    t.string "gender"
    t.string "phone"
    t.string "avatar"
    t.bigint "user_id"
    t.index ["user_id"], name: "index_students_on_user_id"
  end

  create_table "subjects", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "subject_name"
    t.string "level"
    t.integer "price"
    t.bigint "user_id"
    t.datetime "start_time"
    t.datetime "end_time"
    t.datetime "day"
    t.index ["user_id"], name: "index_subjects_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "email", null: false
    t.string "encrypted_password", limit: 128, null: false
    t.string "confirmation_token", limit: 128
    t.string "remember_token", limit: 128, null: false
    t.string "first_name"
    t.string "last_name"
    t.string "gender"
    t.string "phone"
    t.integer "role"
    t.string "avatar"
    t.integer "creator_id"
    t.index ["email"], name: "index_users_on_email"
    t.index ["remember_token"], name: "index_users_on_remember_token"
  end

  add_foreign_key "attendance", "classes", column: "classes_id"
  add_foreign_key "attends", "classes", column: "classes_id"
  add_foreign_key "attends", "students"
  add_foreign_key "classes", "students", column: "students_id"
  add_foreign_key "classes", "subjects"
  add_foreign_key "classes", "subjects", column: "subjects_id"
  add_foreign_key "grades", "classes", column: "classes_id"
  add_foreign_key "students", "users"
  add_foreign_key "subjects", "users"
end
