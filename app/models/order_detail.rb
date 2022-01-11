class OrderDetail < ApplicationRecord

  # validates :item_id, numericality: { only_integer: true }
  # validates :order_id, numericality: { only_integer: true }
  # validates :price, numericality: { only_integer: true }
  # validates :amount, numericality: { only_integer: true }

  belongs_to :order
  belongs_to :item

  # 商品の小計
  def subtotal
    item.with_tax_price * amount
  end

end