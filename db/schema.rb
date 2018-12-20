ActiveRecord ::Schema.define(version: 2) do

    create_table "posts", force: :cascade do |t|
        t.string "text"
        t.string "use_id"
    end

create_table "users", force: :cascade do |t|
    t.string "email"
    t.string "password"
    t.string "firstName"
    t.string "lastName"
    t.string "phoneNum"
    t.string "gender"
  end

end