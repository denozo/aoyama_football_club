class Member < ApplicationRecord
    
    belongs_to :category
    
    attachment :image
    
end
