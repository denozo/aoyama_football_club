FactoryBot.define do
  factory :event do
    title { Faker::Lorem.characters(number:20) }
    start_time { Date.new(2030, 01, 21) }
    end_time { Date.new(2030, 11, 12) }
    content { Faker::Lorem.characters(number:50) }
  end
end