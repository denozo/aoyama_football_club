class Information < ApplicationRecord
  
  # validates :category, numericality: { only_integer: true }
  validates :title, presence: true, length: { maximum: 30 }
  validates :content, presence: true

  attachment :image

  enum category: { general: 0, announcement: 1, other: 2}

end