class Guardian < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :favorites, dependent: :destroy
  
  validates :last_name, presence: true, length: { maximum: 20 }
  validates :first_name, presence: true, length: { maximum: 20 }
  validates :last_name_kana, presence: true, length: { maximum: 20 }
  validates :first_name_kana, presence: true, length: { maximum: 20 }
  validates :email, length: { maximum: 50}
  #郵便番号のバリデーション設定で正規表現を使用。スラッシュの間/この中に正規表現/
  VALID_POSTAL_CODE_REGEX = /\A\d{3}[-]?\d{4}\Z/
  validates :postal_code, presence: true, format: { with: VALID_POSTAL_CODE_REGEX }
  validates :address, presence: true
  validates :tel, presence: true
  
  
end
