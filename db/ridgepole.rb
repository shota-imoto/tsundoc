# -*- mode: ruby -*-
# vi: set ft=ruby :
# Command: ridgepole -c config/database.yml --apply

create_table "tsundocs", force: :cascade do |t|
  t.integer "tsundoc_list_id", null: false
  t.integer "material_id", null: false
  t.integer "status", null: false, default: 0
  t.integer "priority_pt", null: false, default: 0
  t.boolean "private", null: :false, default: :false
  t.timestamps
end

create_table "yondocos" do |t|
  t.integer "tsundoc_id", null: false
  t.integer "user_id", null: false
  t.integer "status", null: false, default: 0
  t.timestamps
end

create_table "tsundoc_lists", force: :cascade do |t|
  t.integer "user_id", null: false
  t.timestamps
end

create_table "materials", force: :cascade do |t|
end

create_table "books", force: :cascade do |t|
  t.string "title", null: false
  t.string "author"
  t.integer "material_id", null: false
  t.timestamps
end

create_table "movies", force: :cascade do |t|
  t.string "title", null: false
  t.integer "material_id", null: false
  t.timestamp
end

create_table "users", force: :cascade do |t|
  t.string "name", null: :false
  ## Database authenticatable
  t.string "email", null: false, default: ""
  t.string "encrypted_password", null: false, default: ""

  ## Recoverable
  t.string   "reset_password_token"
  t.datetime "reset_password_sent_at"

  ## Rememberable
  t.datetime "remember_created_at"

  ## Trackable
  # t.integer  :sign_in_count, default: 0, null: false
  # t.datetime :current_sign_in_at
  # t.datetime :last_sign_in_at
  # t.string   :current_sign_in_ip
  # t.string   :last_sign_in_ip

  ## Confirmable
  # t.string   :confirmation_token
  # t.datetime :confirmed_at
  # t.datetime :confirmation_sent_at
  # t.string   :unconfirmed_email # Only if using reconfirmable

  ## Lockable
  # t.integer  :failed_attempts, default: 0, null: false # Only if lock strategy is :failed_attempts
  # t.string   :unlock_token # Only if unlock strategy is :email or :both
  # t.datetime :locked_at

  t.timestamps
end

create_table "tags", force: :cascade do |t|
  t.string "name", null: false
  t.integer "kind", null: false, default: 0
  t.timestamps
end

create_table "taggings", force: :cascade do |t|
  t.integer "tag_id", null: false
  t.integer "tsundoc_id", null: false
  t.timestamps
end
