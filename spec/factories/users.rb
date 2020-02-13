FactoryBot.define do

  factory :user do
    nickname              {"banba"}
    email                 {"kkk@gmail.com"}
    famiry_name           {"馬場"}
    first_name            {"健二"}
    famiry_name_kana      {"バンバ"}
    first_name_kana       {"ケンジ"}
    password              {"00000000"}
    password_confirmation {"00000000"}
    postal_code           {"5731112"}
    adress_prefecture     {"大阪府"}
    adress_town           {"テスト市"}
    adress_number         {"テスト１丁目"}
    adress_name           {"テストビルディング１階"}
    birthday              {"2003-10-02"}
  end

end