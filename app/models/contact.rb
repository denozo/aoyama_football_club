class Contact < ApplicationRecord

  validates :name, presence: true, length: { maximum: 20 }
  validates :email, presence: true, length: { maximum: 300 }, format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }
  validates :content, presence: true, length: { minimum: 10 }

  enum answer_status: { unanswered: 0, answer_complete: 1}
  
  validates_acceptance_of :confirming
  after_validation :check_confirming

  def check_confirming
    errors.delete(:confirming)
    self.confirming = errors.empty? ? '1' : ''
  end
  
end