FactoryBot.define do
  factory :order do
    name { Faker::Name.name }
    product_passing { "delivery" }
    other { Faker::Lorem.characters(number:20) }
    postal_code { "021-1234" }
    address { Faker::Lorem.characters(number:20) }
    addressee { Faker::Lorem.characters(number:30) }
    total_payment { 800 }
  end
end