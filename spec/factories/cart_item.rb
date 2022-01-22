FactoryBot.define do
  factory :cart_item do
    association :cart, factory: :cart
    association :item, factory: :item
  end
end