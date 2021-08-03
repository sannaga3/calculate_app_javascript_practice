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

ActiveRecord::Schema.define(version: 2021_08_02_215333) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "curriculums", force: :cascade do |t|
    t.integer "math"
    t.integer "english"
    t.integer "science"
    t.integer "total_score"
    t.float "average_score"
    t.string "grade"
    t.string "remarks"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "student_id"
    t.index ["student_id"], name: "index_curriculums_on_student_id"
  end

  create_table "double_checks", force: :cascade do |t|
    t.string "teacher_name"
    t.integer "check"
    t.string "comment"
    t.bigint "curriculum_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["curriculum_id"], name: "index_double_checks_on_curriculum_id"
  end

  create_table "students", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "curriculums", "students"
  add_foreign_key "double_checks", "curriculums"
end
