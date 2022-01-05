class OrderDetail < ApplicationRecord

  # validates :item_id, numericality: { only_integer: true }
  # validates :order_id, numericality: { only_integer: true }
  # validates :price, numericality: { only_integer: true }
  # validates :amount, numericality: { only_integer: true }

  belongs_to :order
  belongs_to :item

end