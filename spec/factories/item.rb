FactoryBot.define do
  factory :item do
    name { Faker::Lorem.characters(number:40) }
    introduction { Faker::Lorem.characters(number:200) }
    price { Faker::Number.between(from: 10).to_i }
    image_id { Rack::Test::UploadedFile.new(File.join(Rails.root,'spec/fixture/image.jpg')) }
  end
end