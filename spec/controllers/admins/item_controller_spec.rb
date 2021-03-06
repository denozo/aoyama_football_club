require 'rails_helper'

describe Admins::ItemsController, type: :controller do
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
    # @itemを作成
    before do
      @item = FactoryBot.create(:item)
    end
    #未ログインユーザーの場合
    context "ログインユーザーではない" do
      # showアクションのレスポンスのステータスが「302（失敗）」であることを確認
      it "302応答を返すことを確認" do
        get :show, params: {id: @item.id }
        expect(response).to have_http_status "302"
      end
      # ログインユーザー意外がindexアクションを行うとサインインページに遷移
      it "サインインページに遷移することを確認" do
        get :show, params: {id: @item.id }
        expect(response).to redirect_to "/admins/sign_in"
      end
    end
  end
  describe "#edit" do
    # @itemを作成
    before do
      @item = FactoryBot.create(:item, name: "テスト" )
    end
    #未ログインユーザーの場合
    context "ログインユーザーではない" do
      it "302応答を返すことを確認" do
        # itemのインスタンスを生成する為の情報を「item_params」に格納
        item_params = FactoryBot.create(:item)
        # 「item_params」をGETで送信する
        get :edit, params: {id: @item.id, item: item_params }
        # レスポンスのステータスが「302（失敗）」であることを確認
        expect(response).to have_http_status "302"
      end
      it "サインインページに遷移することを確認" do
        # itemのインスタンスを生成する為の情報を「item_params」に格納
        item_params = FactoryBot.create(:item)
        # 「item_params」をGETで送信する
        get :edit, params: {id: @item.id, item: item_params }
        # ログインユーザー意外がeditアクションを行うとサインインページに遷移
        expect(response).to redirect_to "/admins/sign_in"
      end
    end
  end
  describe "#update" do
    # @itemを作成
    before do
      @item = FactoryBot.create(:item, name: "テスト" )
    end
    #未ログインユーザーの場合
    context "ログインユーザーではない" do
      it "302応答を返すことを確認" do
        # itemのインスタンスを生成する為の情報を「item_params」に格納
        item_params = FactoryBot.attributes_for(:item)
        # 「item_params」をPATCHで送信する
        patch :update, params: {id: @item.id, item: item_params }
        # レスポンスのステータスが「302（失敗）」であることを確認
        expect(response).to have_http_status "302"
      end
      it "サインインページに遷移することを確認" do
        # itemのインスタンスを生成する為の情報を「item_params」に格納
        item_params = FactoryBot.attributes_for(:item)
        # 「item_params」をPATCHで送信する
        patch :update, params: {id: @item.id, item: item_params }
        # ログインユーザー意外がupdateアクションを行うとサインインページに遷移
        expect(response).to redirect_to "/admins/sign_in"
      end
    end
  end
  describe "#destroy" do
    # @itemを作成
    before do
      @item = FactoryBot.create(:item)
    end
    #未ログインユーザーの場合
    context "ログインユーザーではない" do
      it "302応答を返すことを確認" do
        # DELETEを@itemに送信する
        delete :destroy, params: {id: @item.id }
        # レスポンスのステータスが「302（失敗）」であることを確認
        expect(response).to have_http_status "302"
      end
      it "サインインページに遷移することを確認" do
        # DELETEを@itemに送信する
        delete :destroy, params: {id: @item.id }
        # ログインユーザー意外がupdateアクションを行うとサインインページに遷移
        expect(response).to redirect_to "/admins/sign_in"
      end
    end
  end
end