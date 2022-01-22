require 'rails_helper'

describe Admins::GameResultsController, type: :controller do
  describe "#index" do
    #未ログインユーザーの場合
    context "ログインユーザーではない" do
      # indexアクションのレスポンスのステータスが「302（失敗）」であることを確認
      it "302応答を返すことを確認" do
        get :index
        expect(response).to have_http_status "302"
      end
      # ログインユーザー意外がindexアクションを行うとサインインページに遷移
      it "サインインページに遷移することを確認" do
        get :index
        expect(response).to redirect_to "/admins/sign_in"
      end
    end
  end
  describe "#show" do
    # @game_resultを作成
    before do
      @game_result = FactoryBot.create(:game_result )
    end
    #未ログインユーザーの場合
    context "ログインユーザーではない" do
      # showアクションのレスポンスのステータスが「302（失敗）」であることを確認
      it "302応答を返すことを確認" do
        get :show, params: {id: @game_result.id }
        expect(response).to have_http_status "302"
      end
      # ログインユーザー意外がindexアクションを行うとサインインページに遷移
      it "サインインページに遷移することを確認" do
        get :show, params: {id: @game_result.id }
        expect(response).to redirect_to "/admins/sign_in"
      end
    end
  end
  describe "#create" do
    #未ログインユーザーの場合
    context "ログインユーザーではない" do
      it "302応答を返すことを確認" do
        # game_resultのインスタンスを生成する為の情報を「game_result_params」に格納
        game_result_params = FactoryBot.attributes_for(:game_result)
        # 「game_result_params」をPOSTで送信する
        post :create, params: {game_result: game_result_params }
        # レスポンスのステータスが「302（失敗）」であることを確認
        expect(response).to have_http_status "302"
      end
      it "サインインページに遷移することを確認" do
        # game_resultのインスタンスを生成する為の情報を「game_result_params」に格納
        game_result_params = FactoryBot.attributes_for(:game_result)
        # 「game_result_params」をPOSTで送信する
        post :create, params: {game_result: game_result_params }
        # ログインユーザー意外がcreateアクションを行うとサインインページに遷移
        expect(response).to redirect_to "/admins/sign_in"
      end
    end
  end
  describe "#edit" do
    # @game_resultを作成
    before do
      @game_result = FactoryBot.create(:game_result, tournament_name: "テスト")
    end
    #未ログインユーザーの場合
    context "ログインユーザーではない" do
      it "302応答を返すことを確認" do
        # game_resultのインスタンスを生成する為の情報を「game_result_params」に格納
        game_result_params = FactoryBot.create(:game_result)
        # 「game_result_params」をGETで送信する
        get :edit, params: {id: @game_result.id, game_result: game_result_params }
        # レスポンスのステータスが「302（失敗）」であることを確認
        expect(response).to have_http_status "302"
      end
      it "サインインページに遷移することを確認" do
        # game_resultのインスタンスを生成する為の情報を「game_result_params」に格納
        game_result_params = FactoryBot.create(:game_result)
        # 「game_result_params」をGETで送信する
        get :edit, params: {id: @game_result.id, game_result: game_result_params }
        # ログインユーザー意外がeditアクションを行うとサインインページに遷移
        expect(response).to redirect_to "/admins/sign_in"
      end
    end
  end
  describe "#update" do
    # @game_resultを作成
    before do
      @game_result = FactoryBot.create(:game_result, tournament_name: "テスト")
    end
    #未ログインユーザーの場合
    context "ログインユーザーではない" do
      it "302応答を返すことを確認" do
        # game_resultのインスタンスを生成する為の情報を「game_result_params」に格納
        game_result_params = FactoryBot.attributes_for(:game_result)
        # 「game_result_params」をPATCHで送信する
        patch :update, params: {id: @game_result.id, game_result: game_result_params }
        # レスポンスのステータスが「302（失敗）」であることを確認
        expect(response).to have_http_status "302"
      end
      it "サインインページに遷移することを確認" do
        # game_resultのインスタンスを生成する為の情報を「game_result_params」に格納
        game_result_params = FactoryBot.attributes_for(:game_result)
        # 「game_result_params」をPATCHで送信する
        patch :update, params: {id: @game_result.id, game_result: game_result_params }
        # ログインユーザー意外がupdateアクションを行うとサインインページに遷移
        expect(response).to redirect_to "/admins/sign_in"
      end
    end
  end
  describe "#destroy" do
    # @game_resultを作成
    before do
      @game_result = FactoryBot.create(:game_result)
    end
    #未ログインユーザーの場合
    context "ログインユーザーではない" do
      it "302応答を返すことを確認" do
        # DELETEを@game_resultに送信する
        delete :destroy, params: {id: @game_result.id }
        # レスポンスのステータスが「302（失敗）」であることを確認
        expect(response).to have_http_status "302"
      end
      it "サインインページに遷移することを確認" do
        # DELETEを@game_resultに送信する
        delete :destroy, params: {id: @game_result.id }
        # ログインユーザー意外がupdateアクションを行うとサインインページに遷移
        expect(response).to redirect_to "/admins/sign_in"
      end
    end
  end
end