require 'rails_helper'

describe Event do
  describe '#create' do
    it "全てのカラムに入力があると登録できる" do
      event = build(:event)
      expect(event).to be_valid
    end
    it "titleに入力がないと登録ができない" do
      event = build(:event, title: nil)
      event.valid?
      expect(event.errors[:title]).to include("を入力してください")
    end
    it "titleが30文字以上だと登録できない" do
      event = build(:event, title: "あ" * 31)
      event.valid?
      expect(event.errors[:title]).to include("は30文字以内で入力してください")
    end
    it "start_timeに入力がないと登録ができない" do
      event = build(:event, start_time: nil)
      event.valid?
      expect(event.errors[:start_time]).to include("を入力してください")
    end
    it "end_timeに入力がないと登録ができない" do
      event = build(:event, end_time: nil)
      event.valid?
      expect(event.errors[:end_time]).to include("を入力してください")
    end
    it "start_timeが現在の日時より遅い時間を選択しないと登録できない" do
      event = build(:event, start_time: "2022-01-20")
      event.valid?
      expect(event.errors[:start_time]).to include("は現在の日時より遅い時間を選択してください。")
    end
    it "end_timeがstart_timeより遅い時間を選択しないと登録できない" do
      event = build(:event, start_time: "2030-01-20", end_time: "2030-01-19)")
      event.valid?
      expect(event.errors[:end_time]).to include("は開始日時より遅い時間を選択してください。")
    end
    it "contentに入力がないと登録ができない" do
      event = build(:event, content: nil)
      event.valid?
      expect(event.errors[:content]).to include("を入力してください")
    end
  end
end