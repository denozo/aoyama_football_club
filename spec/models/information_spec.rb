require 'rails_helper'

describe Information do
  describe '#create' do
    it "全てのカラムに入力があると登録できる" do
      information = build(:information)
      expect(information).to be_valid
    end
    it "titleカラムに入力がないと登録できない" do
      information = build(:information, title: nil)
      information.valid?
      expect(information.errors[:title]).to include("を入力してください")
    end
    it "titleは30文字以内でなければ登録できない" do
      information = build(:information, title: "あ" * 31)
      information.valid?
      expect(information.errors[:title]).to include("は30文字以内で入力してください")
    end
    it "contentカラムに入力がないと登録できない" do
      information = build(:information, content: nil)
      information.valid?
      expect(information.errors[:content]).to include("を入力してください")
    end
  end
end