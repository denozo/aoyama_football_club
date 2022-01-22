require 'rails_helper'

describe :information_for_guardian do
  describe '#create' do
    it "全てのカラムに入力があると登録できる" do
      informationforguardian = build(:information_for_guardian)
      expect(informationforguardian).to be_valid
    end
    it "titleカラムに入力がないと登録できない" do
      informationforguardian = build(:information_for_guardian, title: nil)
      informationforguardian.valid?
      expect(informationforguardian.errors[:title]).to include("を入力してください")
    end
    it "titleは30文字以内でなければ登録できない" do
      informationforguardian = build(:information_for_guardian, title: "あ" * 31)
      informationforguardian.valid?
      expect(informationforguardian.errors[:title]).to include("は30文字以内で入力してください")
    end
    it "contentカラムに入力がないと登録できない" do
      informationforguardian = build(:information_for_guardian, content: nil)
      informationforguardian.valid?
      expect(informationforguardian.errors[:content]).to include("を入力してください")
    end
  end
end