FactoryBot.define do
  factory :event do
    title { Faker::Lorem.characters(number:20) }
    start_time { Date.new(2022, 11, 12) }
    end_time { Date.new(2022, 11, 12) }
    content { Faker::Lorem.characters(number:50) }
  end
end