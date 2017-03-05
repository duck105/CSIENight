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

ActiveRecord::Schema.define(version: 20170228110911) do

  create_table "categories", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "information", force: :cascade do |t|
    t.string   "title"
    t.text     "body"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "infors", force: :cascade do |t|
    t.string   "title"
    t.text     "body"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "judges", force: :cascade do |t|
    t.integer  "state"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "user_id"
    t.integer  "question_id"
    t.index ["question_id"], name: "index_judges_on_question_id"
    t.index ["user_id"], name: "index_judges_on_user_id"
  end

  create_table "options", force: :cascade do |t|
    t.text     "body"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "question_id"
    t.index ["question_id"], name: "index_options_on_question_id"
  end

  create_table "questions", force: :cascade do |t|
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "title"
    t.text     "spec"
    t.string   "answer"
    t.integer  "rewardpoint"
    t.integer  "punishpoint"
    t.integer  "category_id"
    t.string   "image"
    t.index ["category_id"], name: "index_questions_on_category_id"
  end

  create_table "submissions", force: :cascade do |t|
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "answer"
    t.integer  "question_id"
    t.integer  "user_id"
    t.string   "state"
    t.index ["question_id"], name: "index_submissions_on_question_id"
    t.index ["user_id"], name: "index_submissions_on_user_id"
  end

  create_table "token_judges", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean  "state"
    t.integer  "user_id"
    t.integer  "token_id"
    t.index ["token_id"], name: "index_token_judges_on_token_id"
    t.index ["user_id"], name: "index_token_judges_on_user_id"
  end

  create_table "tokens", force: :cascade do |t|
    t.string   "answer"
    t.integer  "rewardpoint"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.integer  "score",                  default: 0
    t.string   "provider"
    t.string   "uid"
    t.boolean  "is_admin",               default: false
    t.string   "name"
    t.string   "avatar"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["provider"], name: "index_users_on_provider"
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["uid"], name: "index_users_on_uid"
  end

end
