require 'rails_helper'

describe Member do
  describe '#create' do
    it "全てのカラムに入力があると登録できる" do
      member = build(:member)
      expect(member).to be_valid
    end
    it "last_nameカラムに入力がないと登録できない" do
      member = build(:member, last_name: nil)
      member.valid?
      expect(member.errors[:last_name]).to include("を入力してください")
    end
    it "first_nameカラムに入力がないと登録できない" do
      member = build(:member, first_name: nil)
      member.valid?
      expect(member.errors[:first_name]).to include("を入力してください")
    end
    it "last_name_kanaカラムに入力がないと登録できない" do
      member = build(:member, last_name_kana: nil)
      member.valid?
      expect(member.errors[:last_name_kana]).to include("を入力してください")
    end
    it "first_name_kanaカラムに入力がないと登録できない" do
      member = build(:member, first_name_kana: nil)
      member.valid?
      expect(member.errors[:first_name_kana]).to include("を入力してください")
    end
    it "positionカラムに入力がないと登録できない" do
      member = build(:member, position: nil)
      member.valid?
      expect(member.errors[:position]).to include("を入力してください")
    end
    it "heightカラムに入力がないと登録できない" do
      member = build(:member, height: nil)
      member.valid?
      expect(member.errors[:height]).to include("は数値で入力してください")
    end
    it "weightカラムに入力がないと登録できない" do
      member = build(:member, weight: nil)
      member.valid?
      expect(member.errors[:weight]).to include("は数値で入力してください")
    end
    it "original_teamカラムに入力がないと登録できない" do
      member = build(:member, original_team: nil)
      member.valid?
      expect(member.errors[:original_team]).to include("を入力してください")
    end
    it "hobbyカラムに入力がないと登録できない" do
      member = build(:member, hobby: nil)
      member.valid?
      expect(member.errors[:hobby]).to include("を入力してください")
    end
    it "goalカラムに入力がないと登録できない" do
      member = build(:member, goal: nil)
      member.valid?
      expect(member.errors[:goal]).to include("を入力してください")
    end

    it "last_nameが20文字以上だと登録できない" do
      member = build(:member, last_name: "あ" * 21)
      member.valid?
      expect(member.errors[:last_name]).to include("は20文字以内で入力してください")
    end
    it "first_nameが20文字以上だと登録できない" do
      member = build(:member, first_name: "あ" * 21)
      member.valid?
      expect(member.errors[:first_name]).to include("は20文字以内で入力してください")
    end
    it "last_name_kanaが20文字以上だと登録できない" do
      member = build(:member, last_name_kana: "あ" * 21)
      member.valid?
      expect(member.errors[:last_name_kana]).to include("は20文字以内で入力してください")
    end
    it "first_name_kanaが20文字以上だと登録できない" do
      member = build(:member, first_name_kana: "あ" * 21)
      member.valid?
      expect(member.errors[:first_name_kana]).to include("は20文字以内で入力してください")
    end
    it "positionが30文字以上だと登録できない" do
      member = build(:member, position: "あ" * 31)
      member.valid?
      expect(member.errors[:position]).to include("は30文字以内で入力してください")
    end
    it "heightが3文字で入力しないと登録できない" do
      member = build(:member, height: "1234")
      member.valid?
      expect(member.errors[:height]).to include("は3文字で入力してください")
    end
    it "heightが3文字で以下だと登録できない" do
      member = build(:member, height: "12")
      member.valid?
      expect(member.errors[:height]).to include("は3文字で入力してください")
    end
    it "weightは2文字以上でなければ登録できない" do
      member = build(:member, weight: "1")
      member.valid?
      expect(member.errors[:weight]).to include("は2文字以上で入力してください")
    end
    it "weightは3文字以内でなければ登録できない" do
      member = build(:member, weight: "1234")
      member.valid?
      expect(member.errors[:weight]).to include("は3文字以内で入力してください")
    end
    it "original_teamは50文字以内でなければ登録できない" do
      member = build(:member, original_team: "あ" * 51 )
      member.valid?
      expect(member.errors[:original_team]).to include("は50文字以内で入力してください")
    end
    it "hobbyは50文字以内でなければ登録できない" do
      member = build(:member, hobby: "あ" * 51 )
      member.valid?
      expect(member.errors[:hobby]).to include("は50文字以内で入力してください")
    end
    it "goalは50文字以内でなければ登録できない" do
      member = build(:member, goal: "あ" * 51 )
      member.valid?
      expect(member.errors[:goal]).to include("は50文字以内で入力してください")
    end
  end
end