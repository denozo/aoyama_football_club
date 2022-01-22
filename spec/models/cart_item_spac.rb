require 'rails_helper'

describe CartItem do
  describe '#create' do
    it "全てのカラムに入力があると登録できる" do
      cart_item = build(:cart_item)
      expect(cart_item).to be_valid
    end
  end
end