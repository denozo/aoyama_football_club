class Item < ApplicationRecord

  has_many :cart_items
  has_many :order_details

  attachment :image

  enum is_active: { sales_stop: false, on_sale: true }

  def with_tax_price
    (price * 1.1).floor
  end

end