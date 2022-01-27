FactoryBot.define do
  factory :order do
    name { Faker::Name.name }
    product_passing { "delivery" }
    other { Faker::Lorem.characters(number:20) }
    postal_code { "021-1234" }
    address { Faker::Lorem.characters(number:20) }
    addressee { Faker::Lorem.characters(number:30) }
    total_payment { 800 }
    email { Faker::Internet.email }
    shipping_cost { 800 }
    order_status { 0 }
    trait :stock_confirmation do
        order_status { stock_confirmation }
    end
    trait :contact_complete do
        order_status { contact_complete }
    end
    trait :passing_complete do
        order_status { passing_complete }
    end
  end
end