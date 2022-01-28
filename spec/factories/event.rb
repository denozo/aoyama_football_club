FactoryBot.define do
  factory :event do
    now = Time.current
    title { Faker::Lorem.characters(number:20) }
    start_time { now.since(3.days) }
    end_time { (now.since(5.days)) }
    content { Faker::Lorem.characters(number:50) }
  end
end