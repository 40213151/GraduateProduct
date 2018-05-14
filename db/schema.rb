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

ActiveRecord::Schema.define(version: 20180514073727) do

  create_table "blog_images", force: :cascade do |t|
    t.string "blog_id"
    t.string "image_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "blogs", force: :cascade do |t|
    t.string "blog_title"
    t.string "blog_content"
    t.integer "farmer_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "image_file_name"
    t.string "image_content_type"
    t.integer "image_file_size"
    t.datetime "image_updated_at"
    t.index ["farmer_id"], name: "index_blogs_on_farmer_id"
  end

  create_table "chat_messages", force: :cascade do |t|
    t.integer "student_id"
    t.integer "famer_id"
    t.text "body"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "conversations", force: :cascade do |t|
    t.integer "sender_id"
    t.integer "recipient_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "farmer_images", force: :cascade do |t|
    t.integer "farmer_id"
    t.string "image_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "farmers", force: :cascade do |t|
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
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "provider"
    t.string "uid"
    t.string "image"
    t.string "name"
    t.string "phone_number"
    t.string "job_about"
    t.string "place"
    t.string "leader_name"
    t.integer "member_number"
    t.text "description_us"
    t.text "description_about"
    t.string "image_file_name"
    t.string "image_content_type"
    t.integer "image_file_size"
    t.datetime "image_updated_at"
    t.float "latitude"
    t.float "longitude"
    t.index ["email"], name: "index_farmers_on_email", unique: true
    t.index ["reset_password_token"], name: "index_farmers_on_reset_password_token", unique: true
  end

  create_table "job_images", force: :cascade do |t|
    t.integer "job_id"
    t.string "image_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "jobs", force: :cascade do |t|
    t.string "name"
    t.string "place"
    t.text "description"
    t.string "character"
    t.integer "price_perhour"
    t.integer "farmer_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.datetime "date"
    t.float "latitude"
    t.float "longitude"
    t.index ["farmer_id"], name: "index_jobs_on_farmer_id"
  end

  create_table "mails", force: :cascade do |t|
    t.text "body"
    t.integer "talk_id"
    t.integer "student_id"
    t.integer "farmer_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["farmer_id"], name: "index_mails_on_farmer_id"
    t.index ["student_id"], name: "index_mails_on_student_id"
    t.index ["talk_id"], name: "index_mails_on_talk_id"
  end

  create_table "messages", force: :cascade do |t|
    t.text "body"
    t.integer "conversation_id"
    t.integer "farmer_id"
    t.integer "student_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["conversation_id"], name: "index_messages_on_conversation_id"
    t.index ["farmer_id"], name: "index_messages_on_farmer_id"
    t.index ["student_id"], name: "index_messages_on_student_id"
  end

  create_table "reservations", force: :cascade do |t|
    t.integer "student_id"
    t.integer "job_id"
    t.datetime "date"
    t.datetime "end_date"
    t.integer "price_perhour"
    t.integer "total_price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["job_id"], name: "index_reservations_on_job_id"
    t.index ["student_id"], name: "index_reservations_on_student_id"
  end

  create_table "reviews", force: :cascade do |t|
    t.text "description"
    t.integer "rate"
    t.integer "farmer_id"
    t.integer "student_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["farmer_id"], name: "index_reviews_on_farmer_id"
    t.index ["student_id"], name: "index_reviews_on_student_id"
  end

  create_table "student_images", force: :cascade do |t|
    t.integer "student_id"
    t.string "image_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "students", force: :cascade do |t|
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
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "name"
    t.string "place"
    t.string "school"
    t.text "description_pr"
    t.integer "age"
    t.text "description_interested"
    t.string "facebook"
    t.string "twitter"
    t.string "image_file_name"
    t.string "image_content_type"
    t.integer "image_file_size"
    t.datetime "image_updated_at"
    t.float "latitude"
    t.float "longitude"
    t.string "image"
    t.index ["email"], name: "index_students_on_email", unique: true
    t.index ["reset_password_token"], name: "index_students_on_reset_password_token", unique: true
  end

end
