FactoryBot.define do
  factory :member do
    association :category, factory: :category
    last_name { Faker::Lorem.characters(number:10) }
    first_name { Faker::Lorem.characters(number:10) }
    last_name_kana{ "タナカ" }
    first_name_kana { "タロウ" }
    position { "MF" }
    height { 176 }
    weight { 65 }
    original_team { "青山中学校" }
    hobby { "読書" }
    goal { "頑張ります" }
    image_id { Faker::Number.between(from: 10).to_i }
    image { Rack::Test::UploadedFile.new(File.join(Rails.root,'spec/fixture/image.jpg')) }
  end
end