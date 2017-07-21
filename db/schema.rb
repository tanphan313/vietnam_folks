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

ActiveRecord::Schema.define(version: 20170721032925) do

  create_table "backgrounds", force: :cascade do |t|
    t.integer  "m_folk_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["m_folk_id"], name: "index_backgrounds_on_m_folk_id"
  end

  create_table "categories", force: :cascade do |t|
    t.string   "title"
    t.text     "description"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "category_backgrounds", force: :cascade do |t|
    t.integer  "category_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["category_id"], name: "index_category_backgrounds_on_category_id"
  end

  create_table "feature_translations", force: :cascade do |t|
    t.text     "description"
    t.integer  "feature_type"
    t.integer  "folk_translation_id"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.index ["folk_translation_id"], name: "index_feature_translations_on_folk_translation_id"
  end

  create_table "folk_categories", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "folk_category_translations", force: :cascade do |t|
    t.string   "name"
    t.integer  "folk_category_id"
    t.integer  "m_language_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.index ["folk_category_id"], name: "index_folk_category_translations_on_folk_category_id"
    t.index ["m_language_id"], name: "index_folk_category_translations_on_m_language_id"
  end

  create_table "folk_translations", force: :cascade do |t|
    t.string   "name"
    t.text     "introduction"
    t.text     "population"
    t.text     "residence_area"
    t.text     "community_organization"
    t.integer  "m_folk_id"
    t.integer  "m_language_id"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.index ["m_folk_id"], name: "index_folk_translations_on_m_folk_id"
    t.index ["m_language_id"], name: "index_folk_translations_on_m_language_id"
  end

  create_table "image_description_translations", force: :cascade do |t|
    t.integer  "image_id"
    t.string   "description_content"
    t.integer  "m_language_id"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
    t.index ["image_id"], name: "index_image_description_translations_on_image_id"
    t.index ["m_language_id"], name: "index_image_description_translations_on_m_language_id"
  end

  create_table "image_feature_translations", force: :cascade do |t|
    t.integer  "image_id"
    t.integer  "feature_translation_id"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
    t.index ["feature_translation_id"], name: "index_image_feature_translations_on_feature_translation_id"
    t.index ["image_id"], name: "index_image_feature_translations_on_image_id"
  end

  create_table "images", force: :cascade do |t|
    t.integer  "imageable_id"
    t.string   "imageable_type"
    t.string   "picture"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  create_table "lesson_questions", force: :cascade do |t|
    t.integer  "lesson_id"
    t.integer  "question_id"
    t.integer  "question_answer_id"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
    t.index ["lesson_id"], name: "index_lesson_questions_on_lesson_id"
    t.index ["question_answer_id"], name: "index_lesson_questions_on_question_answer_id"
    t.index ["question_id"], name: "index_lesson_questions_on_question_id"
  end

  create_table "lessons", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "category_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["category_id"], name: "index_lessons_on_category_id"
    t.index ["user_id"], name: "index_lessons_on_user_id"
  end

  create_table "m_folks", force: :cascade do |t|
    t.string   "name"
    t.integer  "sort"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.integer  "folk_category_id"
  end

  create_table "m_languages", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "question_answers", force: :cascade do |t|
    t.string   "content"
    t.integer  "question_id"
    t.boolean  "correct"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["question_id"], name: "index_question_answers_on_question_id"
  end

  create_table "questions", force: :cascade do |t|
    t.string   "content"
    t.integer  "category_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["category_id"], name: "index_questions_on_category_id"
  end

  create_table "sentences", force: :cascade do |t|
    t.string   "content"
    t.string   "meaning"
    t.string   "description"
    t.integer  "category_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["category_id"], name: "index_sentences_on_category_id"
  end

  create_table "teasers", force: :cascade do |t|
    t.integer  "m_folk_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["m_folk_id"], name: "index_teasers_on_m_folk_id"
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.boolean  "admin"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "word_backgrounds", force: :cascade do |t|
    t.integer  "word_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["word_id"], name: "index_word_backgrounds_on_word_id"
  end

  create_table "words", force: :cascade do |t|
    t.string   "content"
    t.string   "meaning"
    t.integer  "category_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["category_id"], name: "index_words_on_category_id"
  end

end
