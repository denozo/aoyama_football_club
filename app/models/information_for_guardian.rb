class InformationForGuardian < ApplicationRecord

  attachment :image

  enum category: { general: 0, announcement: 1, other: 2}

  has_many :favorites, dependent: :destroy

  def favorited_by?(guardian)
    favorites.where(guardian_id: guardian.id).exists?
  end

end
