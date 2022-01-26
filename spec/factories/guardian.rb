require 'bcrypt'

FactoryBot.define do
  factory :guardian do
    last_name { Faker::Lorem.characters(number:20) }
    first_name { Faker::Lorem.characters(number:20) }
    last_name_kana { Faker::Lorem.characters(number:20) }
    first_name_kana { Faker::Lorem.characters(number:20) }
    member_name { Faker::Lorem.characters(number:20) }
    relationship { Faker::Lorem.characters(number:10) }
    year_of_enrollment { 2000 }
    postal_code { "021-1234" }
    address { Faker::Lorem.characters(number:20) }
    tel { "000-0000-0000" }
    email { Faker::Internet.email }
    password { 'password' }
    password_confirmation { 'password' }
  end
end