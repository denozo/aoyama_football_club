require 'rails_helper'

describe Guardians::InformationForGuardiansController, type: :controller do
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
        expect(response).to redirect_to "/guardians/sign_in"
      end
    end
    #ログイン済みユーザーの場合
    context "ログイン済みのユーザーの場合" do
      # ユーザーの作成
       before do
        @guardian = FactoryBot.create(:guardian)
      end

      #正常にレスポンスを返すこと
      it "正常にレスポンスを返す" do
        # @Guardianとしてログイン
        sign_in @guardian
        # indexアクションを行うとレスポンスがあることを確認
        get :index
        expect(response).to be_successful
      end
      #200レスポンスを返すこと
      it "200レスポンスを返す" do
        # @Guardianとしてログイン
        sign_in @guardian
        # indexアクションを行うとレスポンスがあることを確認
        get :index
        expect(response).to have_http_status "200"
      end
    end
  end
  describe "#show" do
    #未ログインユーザーの場合
    context "ログインユーザーではない" do
      # information_for_guardianの作成
      before do
        @information_for_guardian = FactoryBot.create(:information_for_guardian)
      end
      # indexアクションのレスポンスのステータスが「302（失敗）」であることを確認
      it "302応答を返すことを確認" do
        get :show, params: {id: @information_for_guardian.id }
        expect(response).to have_http_status "302"
      end
      # ログインユーザー意外がshowアクションを行うとサインインページに遷移
      it "サインインページに遷移することを確認" do
        get :show, params: {id: @information_for_guardian.id }
        expect(response).to redirect_to "/guardians/sign_in"
      end
    end
    #ログイン済みユーザーの場合
    context "ログイン済みのユーザーの場合" do
      # ユーザーの作成
       before do
        @guardian = FactoryBot.create(:guardian)
        @information_for_guardian = FactoryBot.create(:information_for_guardian)
      end

      #正常にレスポンスを返すこと
      it "正常にレスポンスを返す" do
        # @Guardianとしてログイン
        sign_in @guardian
        # indexアクションを行うとレスポンスがあることを確認
        get :show, params: {id: @information_for_guardian.id }
        expect(response).to be_successful
      end
      #200レスポンスを返すこと
      it "200レスポンスを返す" do
        # @Guardianとしてログイン
        sign_in @guardian
        # indexアクションを行うとレスポンスがあることを確認
        get :show, params: {id: @information_for_guardian.id }
        expect(response).to have_http_status "200"
      end
    end
  end
end