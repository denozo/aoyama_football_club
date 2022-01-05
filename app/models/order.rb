class Order < ApplicationRecord

  # validates :name, presence: true, length: { maximum: 20 }
  # validates :product_passing, numericality: { only_integer: true }
  # validates :email, presence: true, length: { maximum: 300 }, format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }
  # # validates :other, presence: true, length: { maximum: 20 }
  # # validates :postal_code, presence: true, format: { with: /\A\d{3}[-]?\d{4}\z/ }
  # # validates :address, presence: true
  # # validates :addressee, presence: true, length: { maximum: 20 }
  # validates :product_passing, numericality: { only_integer: true }
  # validates :total_payment, numericality: { only_integer: true }
  # validates :payment_method, numericality: { only_integer: true }
  # validates :order_status, numericality: { only_integer: true }

  enum product_passing: { delivery: 0, other: 1}
  enum payment_method: { cash: 0, transfer: 1}
  enum order_status: { stock_confirmation: 0, contact_complete: 1, passing_complete: 2}

  has_many :order_details

    #商品合計金額(小計)
  def subtotal
    item.with_tax_price * amount
  end

end