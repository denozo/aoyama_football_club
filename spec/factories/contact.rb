FactoryBot.define do
  factory :contact do
    name { Faker::Name.name }
    email { Faker::Internet.free_email }
    content { Faker::Lorem.characters(number:20) }
  end
end