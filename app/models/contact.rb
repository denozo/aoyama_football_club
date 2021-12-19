class Contact < ApplicationRecord
  validates :name, presence: true, length: { maximum: 20 }
  validates :email, presence: true
  validates :content, presence: true, length: { minimum: 10 }
  
  enum category: { unanswered: 0, answer_complete: 1}
end
