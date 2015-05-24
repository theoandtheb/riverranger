# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20150523142220) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"
  enable_extension "postgis"

  create_table "authentications", force: :cascade do |t|
    t.integer  "user_id",    null: false
    t.string   "provider",   null: false
    t.string   "uid",        null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "authentications", ["provider", "uid"], name: "index_authentications_on_provider_and_uid", using: :btree

  create_table "bools", force: :cascade do |t|
    t.boolean  "mammal"
    t.boolean  "reptile"
    t.boolean  "amphibian"
    t.boolean  "fish"
    t.boolean  "plant"
    t.boolean  "insect"
    t.boolean  "bird"
    t.boolean  "species_at_risk"
    t.boolean  "wildlife_death"
    t.boolean  "shoreline_alterations"
    t.boolean  "water_quality"
    t.boolean  "trash"
    t.boolean  "foam"
    t.boolean  "red_blooms"
    t.boolean  "phragmites"
    t.boolean  "loosestrife"
    t.boolean  "dog_strangling_vine"
    t.boolean  "introduced_honeysuckle"
    t.boolean  "zebra_mussels"
    t.boolean  "giant_hogweed"
    t.boolean  "other_invasive"
    t.integer  "observation_id"
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  add_index "bools", ["observation_id"], name: "index_bools_on_observation_id", using: :btree

  create_table "documents", force: :cascade do |t|
    t.string   "document_file_name"
    t.string   "document_content_type"
    t.integer  "document_file_size"
    t.datetime "document_updated_at"
    t.integer  "observation_id"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  add_index "documents", ["observation_id"], name: "index_documents_on_observation_id", using: :btree

  create_table "observations", force: :cascade do |t|
    t.string   "description"
    t.text     "comment"
    t.geometry "coordinates", limit: {:srid=>4326, :type=>"point"}
    t.integer  "user_id"
    t.string   "loc_nic"
    t.datetime "observe_on"
    t.datetime "created_at",                                        null: false
    t.datetime "updated_at",                                        null: false
  end

  add_index "observations", ["user_id"], name: "index_observations_on_user_id", using: :btree

  create_table "ogrgeojsons", force: :cascade do |t|
    t.string   "name"
    t.geometry "wkb_geometry", limit: {:srid=>4326, :type=>"polygon"}
  end

  create_table "photos", force: :cascade do |t|
    t.string   "image_file_name"
    t.string   "image_content_type"
    t.integer  "image_file_size"
    t.datetime "image_updated_at"
    t.integer  "observation_id"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
  end

  add_index "photos", ["observation_id"], name: "index_photos_on_observation_id", using: :btree

  create_table "studies", force: :cascade do |t|
    t.text     "title"
    t.text     "author"
    t.text     "abstract"
    t.datetime "published"
    t.string   "url"
    t.integer  "observation_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "studies", ["observation_id"], name: "index_studies_on_observation_id", using: :btree

  create_table "tests", force: :cascade do |t|
    t.integer  "ph"
    t.integer  "temperature"
    t.integer  "phosphate"
    t.integer  "clarity"
    t.integer  "oxygen"
    t.integer  "nitri"
    t.integer  "nitrate"
    t.integer  "ecoli"
    t.integer  "observation_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "tests", ["observation_id"], name: "index_tests_on_observation_id", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "username",                                    null: false
    t.string   "email",                                       null: false
    t.string   "crypted_password"
    t.string   "salt"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "activation_state"
    t.string   "activation_token"
    t.datetime "activation_token_expires_at"
    t.string   "reset_password_token"
    t.datetime "reset_password_token_expires_at"
    t.datetime "reset_password_email_sent_at"
    t.string   "remember_me_token"
    t.datetime "remember_me_token_expires_at"
    t.integer  "failed_logins_count",             default: 0
    t.datetime "lock_expires_at"
    t.string   "unlock_token"
    t.datetime "last_login_at"
    t.datetime "last_logout_at"
    t.datetime "last_activity_at"
    t.string   "last_login_from_ip_address"
  end

  add_index "users", ["activation_token"], name: "index_users_on_activation_token", using: :btree
  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["last_logout_at", "last_activity_at"], name: "index_users_on_last_logout_at_and_last_activity_at", using: :btree
  add_index "users", ["remember_me_token"], name: "index_users_on_remember_me_token", using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", using: :btree
  add_index "users", ["unlock_token"], name: "index_users_on_unlock_token", using: :btree

  add_foreign_key "bools", "observations"
  add_foreign_key "documents", "observations"
  add_foreign_key "observations", "users"
  add_foreign_key "photos", "observations"
  add_foreign_key "studies", "observations"
  add_foreign_key "tests", "observations"
end
