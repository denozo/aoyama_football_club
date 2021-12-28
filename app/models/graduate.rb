class Graduate < ApplicationRecord

  validates :year, numericality: { only_integer: true, is: 4 }
  validates :member_list, presence: true
  validates :career_after_graduation, presence: true

  attachment :image

end
