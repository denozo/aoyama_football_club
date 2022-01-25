FactoryBot.define do
  factory :graduate do
    year { 1998 }
    member_list { Faker::Lorem.characters(number:200) }
    career_after_graduation { Faker::Lorem.characters(number:200) }
    # image_id { Rack::Test::UploadedFile.new(File.join(Rails.root,'spec/fixture/image.jpg')) }
  end
end