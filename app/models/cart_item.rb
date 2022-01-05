class CartItem < ApplicationRecord
  
  # validates :item_id, presence: true
  # validates :cart_id, presence: true
  # validates :amount, numericality: {greater_than: 1,less_than: 10} #1商品10個まで
  
  belongs_to :item
  belongs_to :cart
  
  #商品合計金額(小計)
  def subtotal
    item.with_tax_price * amount
  end
  

end