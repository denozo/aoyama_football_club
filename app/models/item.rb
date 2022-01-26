class Item < ApplicationRecord
  
  validates :name, presence: true, length: { maximum: 40 }
  validates :price, numericality: { only_integer: true }
  validates :introduction, presence: true, length: { maximum: 200 }

  has_many :cart_items
  has_many :order_details

  attachment :image

  enum is_active: { sales_stop: false, on_sale: true }

  def with_tax_price
    (price * 1.1).floor
  end

end