class CartItem < ApplicationRecord
  
  belongs_to :item
  belongs_to :cart
  
  #商品合計金額(小計)
  def subtotal
    item.with_tax_price * amount
  end
  

end