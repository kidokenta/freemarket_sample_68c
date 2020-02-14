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
  end

end