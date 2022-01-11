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

ActiveRecord::Schema.define(version: 2022_01_11_100937) do

  create_table "agents", force: :cascade do |t|
    t.string "agent_name"
    t.string "role"
    t.integer "phone_number"
    t.integer "company_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.index ["company_id"], name: "index_agents_on_company_id"
    t.index ["email"], name: "index_agents_on_email", unique: true
    t.index ["reset_password_token"], name: "index_agents_on_reset_password_token", unique: true
  end

  create_table "companies", force: :cascade do |t|
    t.string "company_name"
    t.string "admin_name"
    t.integer "phone_number"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "invitations", force: :cascade do |t|
    t.string "recipient_email"
    t.integer "agent_id", null: false
    t.integer "property_id", null: false
    t.integer "lock_code_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["agent_id"], name: "index_invitations_on_agent_id"
    t.index ["lock_code_id"], name: "index_invitations_on_lock_code_id"
    t.index ["property_id"], name: "index_invitations_on_property_id"
  end

  create_table "lock_codes", force: :cascade do |t|
    t.integer "code"
    t.boolean "invitation"
    t.integer "property_id", null: false
    t.integer "smart_lock_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["property_id"], name: "index_lock_codes_on_property_id"
    t.index ["smart_lock_id"], name: "index_lock_codes_on_smart_lock_id"
  end

  create_table "properties", force: :cascade do |t|
    t.string "property_type"
    t.integer "bhk"
    t.integer "size"
    t.integer "price"
    t.string "address"
    t.integer "agent_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["agent_id"], name: "index_properties_on_agent_id"
  end

  create_table "smart_locks", force: :cascade do |t|
    t.string "serial_num"
    t.integer "company_id", null: false
    t.integer "property_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["company_id"], name: "index_smart_locks_on_company_id"
    t.index ["property_id"], name: "index_smart_locks_on_property_id"
  end

  add_foreign_key "agents", "companies"
  add_foreign_key "invitations", "agents"
  add_foreign_key "invitations", "lock_codes"
  add_foreign_key "invitations", "properties"
  add_foreign_key "lock_codes", "properties"
  add_foreign_key "lock_codes", "smart_locks"
  add_foreign_key "properties", "agents"
  add_foreign_key "smart_locks", "companies"
  add_foreign_key "smart_locks", "properties"
end
