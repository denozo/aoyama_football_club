class CartItem < ApplicationRecord

  belongs_to :item
  belongs_to :cart

  # 商品の小計
  def subtotal
    item.with_tax_price * amount
  end

end