FactoryBot.define do
  factory :admin do
    email { "admin@gmail.com" }
    password  { "adminadmin" }
    encrypted_password { "adminadmin" }
  end
end