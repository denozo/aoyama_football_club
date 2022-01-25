FactoryBot.define do
  factory :information do
    title { Faker::Lorem.characters(number:30) }
    content { Faker::Lorem.characters(number:200) }
    # image_id { Rack::Test::UploadedFile.new(File.join(Rails.root,'spec/fixture/image.jpg')) }
  end
end