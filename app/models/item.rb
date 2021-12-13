class Item < ApplicationRecord
  
  attachment :image
  
  enum is_active: { sales_stop: false, on_sale: true }
  
end
