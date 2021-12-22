class CartItem < ApplicationRecord
  
  belongs_to :item
  belongs_to :cart
  
  #商品合計金額
  def sum_of_price
    item.price * amount
  end

end