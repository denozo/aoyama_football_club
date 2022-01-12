class Order < ApplicationRecord

  enum product_passing: { delivery: 0, other: 1}
  enum payment_method: { cash: 0, transfer: 1}
  enum order_status: { stock_confirmation: 0, contact_complete: 1, passing_complete: 2}

  validates :name, presence: true, length: { maximum: 20 }
  validates :product_passing, presence: true
  validates :other, presence: true, length: { maximum: 20 }, if: -> { product_passing == "other"}
  validates :postal_code, presence: true, format: { with: /\A\d{3}[-]?\d{4}\z/ }, if: -> { product_passing == "delivery"}
  validates :address, presence: true, if: -> { product_passing == "delivery"}
  validates :addressee, presence: true, length: { maximum: 50 }, if: -> { product_passing == "delivery"}


  validates :payment_method, presence: true


  has_many :order_details

  # 商品の小計
  def subtotal
    item.with_tax_price * amount
  end

end