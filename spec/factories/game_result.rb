FactoryBot.define do
  factory :game_result do
    tournament_name { Faker::Lorem.characters(number:30) }
    game_title { Faker::Lorem.characters(number:30) }
    event_date { Date.new(2022, 11, 12) }
    results_details { Faker::Lorem.characters(number:50) }
  end
end