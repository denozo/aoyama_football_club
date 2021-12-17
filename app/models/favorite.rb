class Favorite < ApplicationRecord
  
  belongs_to :guardian
  belongs_to :information_for_guardian

end
