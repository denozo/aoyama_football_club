FactoryBot.define do
  factory :category do
    category_name { Faker::Lorem.characters(number:10) }
  end
end