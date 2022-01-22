require 'rails_helper'

describe Admins::GraduatesController, type: :controller do
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
  describe "#create" do
    #未ログインユーザーの場合
    context "ログインユーザーではない" do
      it "302応答を返すことを確認" do
        # graduateのインスタンスを生成する為の情報を「graduate_params」に格納
        graduate_params = FactoryBot.attributes_for(:graduate)
        # 「graduate_params」をPOSTで送信する
        post :create, params: {graduate: graduate_params }
        # レスポンスのステータスが「302（失敗）」であることを確認
        expect(response).to have_http_status "302"
      end
      it "サインインページに遷移することを確認" do
        # graduateのインスタンスを生成する為の情報を「graduate_params」に格納
        graduate_params = FactoryBot.attributes_for(:graduate)
        # 「graduate_params」をPOSTで送信する
        post :create, params: {graduate: graduate_params }
        # ログインユーザー意外がcreateアクションを行うとサインインページに遷移
        expect(response).to redirect_to "/admins/sign_in"
      end
    end
  end
  describe "#edit" do
    # @graduateを作成
    before do
      @graduate = FactoryBot.create(:graduate, year: 2000 )
    end
    #未ログインユーザーの場合
    context "ログインユーザーではない" do
      it "302応答を返すことを確認" do
        # graduateのインスタンスを生成する為の情報を「graduate_params」に格納
        graduate_params = FactoryBot.create(:graduate)
        # 「graduate_params」をGETで送信する
        get :edit, params: {id: @graduate.id, graduate: graduate_params }
        # レスポンスのステータスが「302（失敗）」であることを確認
        expect(response).to have_http_status "302"
      end
      it "サインインページに遷移することを確認" do
        # graduateのインスタンスを生成する為の情報を「graduate_params」に格納
        graduate_params = FactoryBot.create(:graduate)
        # 「graduate_params」をGETで送信する
        get :edit, params: {id: @graduate.id, graduate: graduate_params }
        # ログインユーザー意外がeditアクションを行うとサインインページに遷移
        expect(response).to redirect_to "/admins/sign_in"
      end
    end
  end
  describe "#update" do
    # @graduateを作成
    before do
      @graduate = FactoryBot.create(:graduate, year: 2000 )
    end
    #未ログインユーザーの場合
    context "ログインユーザーではない" do
      it "302応答を返すことを確認" do
        # graduateのインスタンスを生成する為の情報を「graduate_params」に格納
        graduate_params = FactoryBot.attributes_for(:graduate)
        # 「graduate_params」をPATCHで送信する
        patch :update, params: {id: @graduate.id, graduate: graduate_params }
        # レスポンスのステータスが「302（失敗）」であることを確認
        expect(response).to have_http_status "302"
      end
      it "サインインページに遷移することを確認" do
        # graduateのインスタンスを生成する為の情報を「graduate_params」に格納
        graduate_params = FactoryBot.attributes_for(:graduate)
        # 「graduate_params」をPATCHで送信する
        patch :update, params: {id: @graduate.id, graduate: graduate_params }
        # ログインユーザー意外がupdateアクションを行うとサインインページに遷移
        expect(response).to redirect_to "/admins/sign_in"
      end
    end
  end
  describe "#destroy" do
    # @graduateを作成
    before do
      @graduate = FactoryBot.create(:graduate)
    end
    #未ログインユーザーの場合
    context "ログインユーザーではない" do
      it "302応答を返すことを確認" do
        # DELETEを@graduateに送信する
        delete :destroy, params: {id: @graduate.id }
        # レスポンスのステータスが「302（失敗）」であることを確認
        expect(response).to have_http_status "302"
      end
      it "サインインページに遷移することを確認" do
        # DELETEを@graduateに送信する
        delete :destroy, params: {id: @graduate.id }
        # ログインユーザー意外がupdateアクションを行うとサインインページに遷移
        expect(response).to redirect_to "/admins/sign_in"
      end
    end
  end
end