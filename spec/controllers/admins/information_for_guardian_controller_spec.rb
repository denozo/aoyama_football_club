require 'rails_helper'

describe Admins::InformationForGuardiansController, type: :controller do
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
    # @informationforguardianを作成
    before do
      @informationforguardian = FactoryBot.create(:information_for_guardian)
    end
    #未ログインユーザーの場合
    context "ログインユーザーではない" do
      # showアクションのレスポンスのステータスが「302（失敗）」であることを確認
      it "302応答を返すことを確認" do
        get :show, params: {id: @informationforguardian.id }
        expect(response).to have_http_status "302"
      end
      # ログインユーザー意外がindexアクションを行うとサインインページに遷移
      it "サインインページに遷移することを確認" do
        get :show, params: {id: @informationforguardian.id }
        expect(response).to redirect_to "/admins/sign_in"
      end
    end
  end
  describe "#edit" do
    # @informationforguardianを作成
    before do
      @informationforguardian = FactoryBot.create(:information_for_guardian, title: "テスト" )
    end
    #未ログインユーザーの場合
    context "ログインユーザーではない" do
      it "302応答を返すことを確認" do
        # informationforguardianのインスタンスを生成する為の情報を「informationforguardian_params」に格納
        informationforguardian_params = FactoryBot.create(:information_for_guardian)
        # 「informationforguardian_params」をGETで送信する
        get :edit, params: {id: @informationforguardian.id, informationforguardian: informationforguardian_params }
        # レスポンスのステータスが「302（失敗）」であることを確認
        expect(response).to have_http_status "302"
      end
      it "サインインページに遷移することを確認" do
        # informationforguardianのインスタンスを生成する為の情報を「informationforguardian_params」に格納
        informationforguardian_params = FactoryBot.create(:information_for_guardian)
        # 「informationforguardian_params」をGETで送信する
        get :edit, params: {id: @informationforguardian.id, informationforguardian: informationforguardian_params }
        # ログインユーザー意外がeditアクションを行うとサインインページに遷移
        expect(response).to redirect_to "/admins/sign_in"
      end
    end
  end
  describe "#update" do
    # @informationforguardianを作成
    before do
      @informationforguardian = FactoryBot.create(:information_for_guardian, title: "テスト" )
    end
    #未ログインユーザーの場合
    context "ログインユーザーではない" do
      it "302応答を返すことを確認" do
        # informationforguardianのインスタンスを生成する為の情報を「informationforguardian_params」に格納
        informationforguardian_params = FactoryBot.attributes_for(:information_for_guardian)
        # 「informationforguardian_params」をPATCHで送信する
        patch :update, params: {id: @informationforguardian.id, informationforguardian: informationforguardian_params }
        # レスポンスのステータスが「302（失敗）」であることを確認
        expect(response).to have_http_status "302"
      end
      it "サインインページに遷移することを確認" do
        # informationforguardianのインスタンスを生成する為の情報を「informationforguardian_params」に格納
        informationforguardian_params = FactoryBot.attributes_for(:information_for_guardian)
        # 「informationforguardian_params」をPATCHで送信する
        patch :update, params: {id: @informationforguardian.id, informationforguardian: informationforguardian_params }
        # ログインユーザー意外がupdateアクションを行うとサインインページに遷移
        expect(response).to redirect_to "/admins/sign_in"
      end
    end
  end
  describe "#destroy" do
    # @informationforguardianを作成
    before do
      @informationforguardian = FactoryBot.create(:information_for_guardian)
    end
    #未ログインユーザーの場合
    context "ログインユーザーではない" do
      it "302応答を返すことを確認" do
        # DELETEを@informationforguardianに送信する
        delete :destroy, params: {id: @informationforguardian.id }
        # レスポンスのステータスが「302（失敗）」であることを確認
        expect(response).to have_http_status "302"
      end
      it "サインインページに遷移することを確認" do
        # DELETEを@informationforguardianに送信する
        delete :destroy, params: {id: @informationforguardian.id }
        # ログインユーザー意外がupdateアクションを行うとサインインページに遷移
        expect(response).to redirect_to "/admins/sign_in"
      end
    end
  end
end