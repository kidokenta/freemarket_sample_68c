FactoryBot.define do

  factory :user do
    nickname              {"banba"}
    email                 {"kkk@gmail.com"}
    family_name           {"馬場"}
    first_name            {"健二"}
    family_name_kana      {"バンバ"}
    first_name_kana       {"ケンジ"}
    password              {"00000000"}
    password_confirmation {"00000000"}
    birthday {"2000-01-01"}
    phonenumber {"08038448639"}
  end

end