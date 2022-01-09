class Category < ApplicationRecord
  
  has_many :members
  
  validates :category_name, presence: true


end
