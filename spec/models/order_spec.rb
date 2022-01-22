require 'rails_helper'

describe Order do
  describe '#create' do
    it "全てのカラムに入力があると登録できる" do
      order = build(:order)
      expect(order).to be_valid
    end
    it "nameカラムに入力がないと登録できない" do
      order = build(:order, name: nil)
      order.valid?
      expect(order.errors[:name]).to include("を入力してください")
    end
    it "product_passingの値がotherの時orderカラムに入力がないと登録できない" do
      order = build(:order, other: nil, product_passing: "other")
      order.valid? if: -> { product_passing == "other"}
      expect(order.errors[:other]).to include("を入力してください")
    end
    it "product_passingの値がdeliveryの時postal_codeカラムに入力がないと登録できない" do
      order = build(:order, postal_code: nil)
      order.valid? if: -> { product_passing == "delivery"}
      expect(order.errors[:postal_code]).to include("を入力してください")
    end
    it "product_passingの値がdeliveryの時addressカラムに入力がないと登録できない" do
      order = build(:order, address: nil)
      order.valid? if: -> { product_passing == "delivery"}
      expect(order.errors[:address]).to include("を入力してください")
    end
    it "product_passingの値がdeliveryの時addresseeカラムに入力がないと登録できない" do
      order = build(:order, addressee: nil)
      order.valid? if: -> { product_passing == "delivery"}
      expect(order.errors[:addressee]).to include("を入力してください")
    end
  end
end