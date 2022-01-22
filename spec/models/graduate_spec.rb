require 'rails_helper'

describe Graduate do
  describe '#create' do
    it "全てのカラムに入力があると登録できる" do
      graduate = build(:graduate)
      expect(graduate).to be_valid
    end
    it "yearカラムに入力がないと登録できない" do
      graduate = build(:graduate, year: nil)
      graduate.valid?
      expect(graduate.errors[:year]).to include("は数値で入力してください")
    end
    it "yearは4文字以上でなければ登録できない" do
      graduate = build(:graduate, year: 12345)
      graduate.valid?
      expect(graduate.errors[:year]).to include("は4文字で入力してください")
    end
    it "yearは数値でなければ登録できない" do
      graduate = build(:graduate, year: "あああ")
      graduate.valid?
      expect(graduate.errors[:year]).to include("は数値で入力してください")
    end
    it "member_listカラムに入力がないと登録できない" do
      graduate = build(:graduate, member_list: nil)
      graduate.valid?
      expect(graduate.errors[:member_list]).to include("を入力してください")
    end
    it "career_after_graduationカラムに入力がないと登録できない" do
      graduate = build(:graduate, career_after_graduation: nil)
      graduate.valid?
      expect(graduate.errors[:career_after_graduation]).to include("を入力してください")
    end
  end
end