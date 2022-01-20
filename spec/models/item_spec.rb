require 'rails_helper'

describe Item do
  describe '#create' do
    it "全てのカラムに入力があると登録できる" do
      item = build(:item)
      expect(item).to be_valid
    end
    it "nameカラムに入力がないと登録できない" do
      item = build(:item, name: nil)
      item.valid?
      expect(item.errors[:name]).to include("を入力してください")
    end
    it "nameは40文字以下でなければ登録できない" do
      item = build(:item, name: ("a" * 41))
      item.valid?
      expect(item.errors[:name]).to include("は40文字以内で入力してください")
    end
    it "imageがアップロードされないと登録できない" do
      item = build(:item, image_id: nil)
      item.valid?
      expect(item).to be_invalid("画像を登録してください")
    end
    it "introductionに入力がないと登録できない" do
      item = build(:item, introduction: nil)
      item.valid?
      expect(item.errors[:introduction]).to include("を入力してください")
    end
    it "introductionは200文字以上だと登録できない" do
      item = build(:item, introduction: ("a" * 201))
      item.valid?
      expect(item.errors[:introduction]).to include("は200文字以内で入力してください")
    end
    it "priceに入力がないと登録できない" do
      item = build(:item, price: nil)
      item.valid?
      expect(item.errors[:price]).to include("は数値で入力してください")
    end
    it "priceは整数でなければ登録できない" do
      item = build(:item, price: "あいうえお")
      item.valid?
      expect(item.errors[:price]).to include("は数値で入力してください")
    end
  end
end