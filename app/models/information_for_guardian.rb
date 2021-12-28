class InformationForGuardian < ApplicationRecord
  
  validates :category, numericality: { only_integer: true }
  validates :title, presence: true, length: { maximum: 20 }
  validates :content, presence: true

  attachment :image

  enum category: { general: 0, announcement: 1, other: 2}

  has_many :favorites, dependent: :destroy

  def favorited_by?(guardian)
    favorites.where(guardian_id: guardian.id).exists?
  end

end
