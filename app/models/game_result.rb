class GameResult < ApplicationRecord
  
  validates :tournament_name, presence: true, length: { maximum: 30 }
  validates :game_title, presence: true, length: { maximum: 30 }
  validates :event_date, presence: true
  validates :results_details, presence: true

  attachment :image

end
