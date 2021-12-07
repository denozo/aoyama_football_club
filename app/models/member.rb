class Member < ApplicationRecord
    
    belongs_to :category
    
    attachment :image
    enum grade: { grade_1st: 0, grade_2nd: 1, grade_3rd: 2, stuff: 3}

end
