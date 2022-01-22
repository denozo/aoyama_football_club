class OrderDetail < ApplicationRecord

  belongs_to :order
  belongs_to :item

  # 商品の小計
  def subtotal
    item.with_tax_price * amount
  end

end