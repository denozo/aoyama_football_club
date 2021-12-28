class Event < ApplicationRecord
  
  validates :title, presence: true, length: { maximum: 20 }
  validates :start_time, presence: true
  validates :end_time, presence: true
  validates :content, presence: true
  
  validate :start_end_check #終了日時が開始日時より遅い日時かチェック
  validate :start_check #開始日時が現在の時間より遅い日時かチェック
  
  def start_end_check
    errors.add(:end_time, "は開始日時より遅い時間を選択してください。") if self.start_time > self.end_time
  end
  
  def start_check
    errors.add(:start_time, "は現在の日時より遅い時間を選択してください。") if self.start_time > Time.now
  end
  
  
end