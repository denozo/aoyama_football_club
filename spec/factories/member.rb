FactoryBot.define do
  factory :member do
    association :category, factory: :category
    last_name { "田中" }
    first_name { "太郎" }
    last_name_kana{ "タナカ" }
    first_name_kana { "タロウ" }
    position { "MF" }
    height { 176 }
    weight { 65 }
    original_team { "青山中学校" }
    hobby { "読書" }
    goal { "頑張ります" }
    image_id { Rack::Test::UploadedFile.new(File.join(Rails.root,'spec/fixture/image.jpg')) }
  end
end