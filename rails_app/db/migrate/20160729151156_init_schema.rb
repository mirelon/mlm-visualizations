class InitSchema < ActiveRecord::Migration
  def up
    
    create_table "cards", force: :cascade do |t|
      t.integer  "user_id"
      t.integer  "parent_id"
      t.datetime "created_at", null: false
      t.datetime "updated_at", null: false
      t.index ["parent_id"], name: "index_cards_on_parent_id"
      t.index ["user_id"], name: "index_cards_on_user_id"
    end
    
    create_table "categories", force: :cascade do |t|
      t.string   "name"
      t.string   "ancestry"
      t.datetime "created_at",       null: false
      t.datetime "updated_at",       null: false
      t.integer  "user_category_id"
    end
    
    create_table "contracts", force: :cascade do |t|
      t.integer  "users_id"
      t.integer  "program_id"
      t.datetime "created_at",             null: false
      t.datetime "updated_at",             null: false
      t.integer  "months",     default: 1, null: false
      t.index ["program_id"], name: "index_contracts_on_program_id"
      t.index ["users_id"], name: "index_contracts_on_users_id"
    end
    
    create_table "offer_categories", force: :cascade do |t|
      t.integer  "offer_id"
      t.integer  "category_id"
      t.datetime "created_at",  null: false
      t.datetime "updated_at",  null: false
      t.index ["category_id"], name: "index_offer_categories_on_category_id"
      t.index ["offer_id"], name: "index_offer_categories_on_offer_id"
    end
    
    create_table "offers", force: :cascade do |t|
      t.integer  "users_id"
      t.string   "name"
      t.text     "description"
      t.datetime "start_date"
      t.datetime "end_date"
      t.boolean  "has_early_access"
      t.datetime "created_at",       null: false
      t.datetime "updated_at",       null: false
      t.decimal  "original_price"
      t.decimal  "final_price"
      t.index ["users_id"], name: "index_offers_on_users_id"
    end
    
    create_table "payments", force: :cascade do |t|
      t.decimal  "amount"
      t.integer  "contract_id"
      t.datetime "created_at",  null: false
      t.datetime "updated_at",  null: false
      t.index ["contract_id"], name: "index_payments_on_contract_id"
    end
    
    create_table "program_rewards", force: :cascade do |t|
      t.integer  "program_id"
      t.integer  "target_program_id"
      t.integer  "from_level"
      t.integer  "to_level"
      t.decimal  "amount"
      t.datetime "created_at",        null: false
      t.datetime "updated_at",        null: false
      t.index ["program_id"], name: "index_program_rewards_on_program_id"
      t.index ["target_program_id"], name: "index_program_rewards_on_target_program_id"
    end
    
    create_table "programs", force: :cascade do |t|
      t.string   "name"
      t.integer  "version",                  default: 1,     null: false
      t.decimal  "price",                    default: "0.0", null: false
      t.decimal  "fee",                      default: "0.0", null: false
      t.decimal  "withdrawal_fee",           default: "0.0", null: false
      t.boolean  "counts_to_parent_status",  default: false, null: false
      t.boolean  "can_invite",               default: false, null: false
      t.boolean  "has_early_access",         default: false, null: false
      t.integer  "partner_offers_max_count", default: 0,     null: false
      t.datetime "created_at",                               null: false
      t.datetime "updated_at",                               null: false
    end
    
    create_table "rewards", force: :cascade do |t|
      t.decimal  "amount"
      t.integer  "payment_id"
      t.integer  "contract_id"
      t.datetime "created_at",  null: false
      t.datetime "updated_at",  null: false
      t.index ["contract_id"], name: "index_rewards_on_contract_id"
      t.index ["payment_id"], name: "index_rewards_on_payment_id"
    end
    
    create_table "user_categories", id: false, force: :cascade do |t|
      t.integer "user_id",     null: false
      t.integer "category_id", null: false
      t.index ["category_id", "user_id"], name: "index_user_categories_on_category_id_and_user_id"
      t.index ["user_id", "category_id"], name: "index_user_categories_on_user_id_and_category_id"
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
      t.string   "ancestry"
      t.boolean  "admin"
      t.string   "invitation_token"
      t.datetime "invitation_created_at"
      t.datetime "invitation_sent_at"
      t.datetime "invitation_accepted_at"
      t.integer  "invitation_limit"
      t.string   "invited_by_type"
      t.integer  "invited_by_id"
      t.integer  "invitations_count",      default: 0
      t.string   "logo_file_name"
      t.string   "logo_content_type"
      t.integer  "logo_file_size"
      t.datetime "logo_updated_at"
      t.string   "firstname"
      t.string   "surname"
      t.string   "address"
      t.date     "birthdate"
      t.string   "ico"
      t.string   "dic"
      t.string   "icdph"
      t.string   "city"
      t.string   "psc"
      t.string   "telephone"
      t.string   "iban"
      t.integer  "user_category_id"
      t.decimal  "lat"
      t.decimal  "lng"
      t.index ["email"], name: "index_users_on_email", unique: true
      t.index ["invitation_token"], name: "index_users_on_invitation_token", unique: true
      t.index ["invitations_count"], name: "index_users_on_invitations_count"
      t.index ["invited_by_id"], name: "index_users_on_invited_by_id"
      t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    end
    
  end

  def down
    raise ActiveRecord::IrreversibleMigration, "The initial migration is not revertable"
  end
end
