# =====Schema=====
#   create_table "users", force: :cascade do |t|
#     t.string   "s_id",                          null: false
#     t.string   "name",                          null: false
#     t.string   "password_salt",                 null: false
#     t.string   "password_hash",                 null: false
#     t.datetime "created_at",                    null: false
#     t.datetime "updated_at",                    null: false
#     t.boolean  "rememberred",   default: false, null: false
#     t.boolean  "isadmin",       default: false, null: false
#   end	

class Admin::User < User
	
end