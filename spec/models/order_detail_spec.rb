require 'rails_helper'

describe OrderDetail do
  describe '#create' do
    it "全てのカラムに入力があると登録できる" do
      order_detail = build(:order_detail)
      expect(order_detail).to be_valid
    end
  end
end