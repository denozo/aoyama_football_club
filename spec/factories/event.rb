FactoryBot.define do
  factory :event do
    now = Time.current+2
    title { Faker::Lorem.characters(number:20) }
    start_time { now }
    end_time { (now.tomorrow+3) }
    content { Faker::Lorem.characters(number:50) }
  end
end