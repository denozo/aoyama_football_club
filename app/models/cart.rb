class Cart < ApplicationRecord
  
  has_many :cart_items, dependent: :destroy
  has_many :items, through: :cart_items
  
  def add_item(item_id)
    cart_items.find_or_initialize_by(item_id: item_id)
  end

end