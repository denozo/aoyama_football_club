require 'rails_helper'

describe Contact do
  describe '#create' do
    it "全てのカラムに入力があると登録できる" do
      contact = build(:contact)
      expect(contact).to be_valid
    end
    it "nameに入力がないと登録ができない" do
      contact = build(:contact, name: nil)
      contact.valid?
      expect(contact.errors[:name]).to include("を入力してください")
    end
    it "nameが20文字以上だと登録できない" do
      contact = build(:contact, name: "あ" * 21)
      contact.valid?
      expect(contact.errors[:name]).to include("は20文字以内で入力してください")
    end
    it "emailに入力がないと登録ができない" do
      contact = build(:contact, email: nil)
      contact.valid?
      expect(contact.errors[:email]).to include("を入力してください")
    end
    it "contactに入力がないと登録ができない" do
      contact = build(:contact, content: nil)
      contact.valid?
      expect(contact.errors[:content]).to include("を入力してください")
    end
    it "contactが10文字以下だと登録できない" do
      contact = build(:contact, content: "あ" * 9)
      contact.valid?
      expect(contact.errors[:content]).to include("は10文字以上で入力してください")
    end
  end
end