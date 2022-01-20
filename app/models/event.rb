class Event < ApplicationRecord

  validates :title, presence: true, length: { maximum: 30 }
  validates :start_time, presence: true
  validates :end_time, presence: true
  validates :content, presence: true

  validate :start_end_check #終了日時が開始日時より遅い日時かチェック
  validate :start_check, on: :create #createアクションのみ開始日時が現在の時間より遅い日時かチェック

  def start_check
    if start_time.present? && start_time < Time.current
      errors.add(:start_time, "は現在の日時より遅い時間を選択してください。")
    end
  end

  def start_end_check
    if start_time.present? && end_time.present? && start_time > end_time
      errors.add(:end_time, "は開始日時より遅い時間を選択してください。")
    end
  end



end