require 'rails_helper'

describe Admins::GuardiansController, type: :controller do
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
    # @guardianを作成
    before do
      @guardian = FactoryBot.create(:guardian )
    end
    #未ログインユーザーの場合
    context "ログインユーザーではない" do
      # showアクションのレスポンスのステータスが「302（失敗）」であることを確認
      it "302応答を返すことを確認" do
        get :show, params: {id: @guardian.id }
        expect(response).to have_http_status "302"
      end
      # ログインユーザー意外がindexアクションを行うとサインインページに遷移
      it "サインインページに遷移することを確認" do
        get :show, params: {id: @guardian.id }
        expect(response).to redirect_to "/admins/sign_in"
      end
    end
  end
  describe "#edit" do
    # @guardianを作成
    before do
      @guardian = FactoryBot.create(:guardian, last_name: "テスト" )
    end
    #未ログインユーザーの場合
    context "ログインユーザーではない" do
      it "302応答を返すことを確認" do
        # guardianのインスタンスを生成する為の情報を「guardian_params」に格納
        guardian_params = FactoryBot.create(:guardian)
        # 「guardian_params」をGETで送信する
        get :edit, params: {id: @guardian.id, guardian: guardian_params }
        # レスポンスのステータスが「302（失敗）」であることを確認
        expect(response).to have_http_status "302"
      end
      it "サインインページに遷移することを確認" do
        # guardianのインスタンスを生成する為の情報を「guardian_params」に格納
        guardian_params = FactoryBot.create(:guardian)
        # 「guardian_params」をGETで送信する
        get :edit, params: {id: @guardian.id, guardian: guardian_params }
        # ログインユーザー意外がeditアクションを行うとサインインページに遷移
        expect(response).to redirect_to "/admins/sign_in"
      end
    end
  end
  describe "#update" do
    # @guardianを作成
    before do
      @guardian = FactoryBot.create(:guardian, last_name: "テスト" )
    end
    #未ログインユーザーの場合
    context "ログインユーザーではない" do
      it "302応答を返すことを確認" do
        # guardianのインスタンスを生成する為の情報を「guardian_params」に格納
        guardian_params = FactoryBot.attributes_for(:guardian)
        # 「guardian_params」をPATCHで送信する
        patch :update, params: {id: @guardian.id, guardian: guardian_params }
        # レスポンスのステータスが「302（失敗）」であることを確認
        expect(response).to have_http_status "302"
      end
      it "サインインページに遷移することを確認" do
        # guardianのインスタンスを生成する為の情報を「guardian_params」に格納
        guardian_params = FactoryBot.attributes_for(:guardian)
        # 「guardian_params」をPATCHで送信する
        patch :update, params: {id: @guardian.id, guardian: guardian_params }
        # ログインユーザー意外がupdateアクションを行うとサインインページに遷移
        expect(response).to redirect_to "/admins/sign_in"
      end
    end
  end
  describe "#destroy" do
    # @guardianを作成
    before do
      @guardian = FactoryBot.create(:guardian)
    end
    #未ログインユーザーの場合
    context "ログインユーザーではない" do
      it "302応答を返すことを確認" do
        # DELETEを@guardianに送信する
        delete :destroy, params: {id: @guardian.id }
        # レスポンスのステータスが「302（失敗）」であることを確認
        expect(response).to have_http_status "302"
      end
      it "サインインページに遷移することを確認" do
        # DELETEを@guardianに送信する
        delete :destroy, params: {id: @guardian.id }
        # ログインユーザー意外がupdateアクションを行うとサインインページに遷移
        expect(response).to redirect_to "/admins/sign_in"
      end
    end
  end
end