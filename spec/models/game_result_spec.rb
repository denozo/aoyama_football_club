require 'rails_helper'

describe GameResult do
  describe '#create' do
    it "全てのカラムに入力があると登録できる" do
      gamer_esult = build(:game_result)
      expect(gamer_esult).to be_valid
    end
    it "tournament_nameに入力がないと登録ができない" do
      gamer_esult = build(:game_result, tournament_name: nil)
      gamer_esult.valid?
      expect(gamer_esult.errors[:tournament_name]).to include("を入力してください")
    end
    it "tournament_nameが30文字以上だと登録できない" do
      gamer_esult = build(:game_result, tournament_name: "a" * 31)
      gamer_esult.valid?
      expect(gamer_esult.errors[:tournament_name][0]).not_to include("は30文字以上だと登録できない")
    end
    it "game_titleに入力がないと登録ができない" do
      gamer_esult = build(:game_result, game_title: nil)
      gamer_esult.valid?
      expect(gamer_esult.errors[:game_title]).to include("を入力してください")
    end
    it "tournament_nameが30文字以上だと登録できない" do
      gamer_esult = build(:game_result, game_title: "a" * 31)
      gamer_esult.valid?
      expect(gamer_esult.errors[:game_title][0]).not_to include("は30文字以上だと登録できない")
    end
    it "event_dateに入力がないと登録ができない" do
      gamer_esult = build(:game_result, event_date: nil)
      gamer_esult.valid?
      expect(gamer_esult.errors[:event_date]).to include("を入力してください")
    end
    it "results_detailsに入力がないと登録ができない" do
      gamer_esult = build(:game_result, results_details: nil)
      gamer_esult.valid?
      expect(gamer_esult.errors[:results_details]).to include("を入力してください")
    end
  end
end