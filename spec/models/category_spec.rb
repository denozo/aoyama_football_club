require 'rails_helper'

describe Category do
  describe '#create' do
    it "全てのカラムに入力があると登録できる" do
      category = build(:category)
      expect(category).to be_valid
    end
    it "category_nameに入力がないと登録ができない" do
      category = build(:category, category_name: nil)
      category.valid?
      expect(category.errors[:category_name]).to include("を入力してください")
    end
  end
end