class Category < ApplicationRecord
  
  has_many :members, dependent: :destroy
  
  validates :category_name, presence: true


end
