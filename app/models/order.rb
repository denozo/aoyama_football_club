class Order < ApplicationRecord
  
  enum product_passing: { delivery: 0, other: 1}
  enum payment_method: { cash: 0, transfer: 1}
  enum order_status: { stock_confirmation: 0, contact_complete: 1, passing_complete: 2}
  
  has_many :orders
  
    #商品合計金額(小計)
  def subtotal
    item.with_tax_price * amount
  end
  
end
