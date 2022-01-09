class Member < ApplicationRecord

    belongs_to :category

    validates :last_name, presence: true, length: { maximum: 20 }
    validates :first_name, presence: true, length: { maximum: 20 }
    validates :last_name_kana, presence: true, length: { maximum: 20 }
    validates :first_name_kana, presence: true, length: { maximum: 20 }
    validates :position, presence: true, length: { maximum: 30 }
    validates :height, numericality: { only_integer: true}, length: {in: 1..3}
    validates :weight, numericality: { only_integer: true}, length: {in: 1..3}
    validates :original_team, presence: true, length: { maximum: 50 }
    validates :hobby, presence: true, length: { maximum: 50 }
    validates :goal, presence: true, length: { maximum: 50 }


    attachment :image

    enum grade: { grade_1st: 0, grade_2nd: 1, grade_3rd: 2, staff: 3}


end