FactoryBot.define do
  factory :guardian do
    last_name { "田中" }
    first_name { "太郎" }
    last_name_kana{ "タナカ" }
    first_name_kana { "タロウ" }
    member_name { "田中　次郎" }
    relationship { "父" }
    year_of_enrollment { 2000 }
    postal_code { "021-1234" }
    address { Faker::Lorem.characters(number:20) }
    tel { "000-0000-0000" }
    email { Faker::Internet.free_email }
    password  { "1234567" }
    encrypted_password { "1234567" }
  end
end