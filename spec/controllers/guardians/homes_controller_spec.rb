require 'rails_helper'

describe Guardians::HomesController, type: :controller do
  describe "#show" do
    #未ログインユーザーの場合
    context "ログインユーザーではない" do
      # ユーザーの作成
      before do
        @guardian = FactoryBot.create(:guardian)
      end
      # indexアクションのレスポンスのステータスが「302（失敗）」であることを確認
      it "302応答を返すことを確認" do
        get :show, params: {id: @guardian.id }
        expect(response).to have_http_status "302"
      end
      # ログインユーザー意外がshowアクションを行うとサインインページに遷移
      it "サインインページに遷移することを確認" do
        get :show, params: {id: @guardian.id }
        expect(response).to redirect_to "/guardians/sign_in"
      end
    end
    #ログイン済みの場合
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
        get :show, params: {id: @guardian.id }
        expect(response).to be_successful
      end
      #200レスポンスを返すこと
      it "200レスポンスを返す" do
        # @Guardianとしてログイン
        sign_in @guardian
        # indexアクションを行うとレスポンスがあることを確認
        get :show, params: {id: @guardian.id }
        expect(response).to have_http_status "200"
      end
    end
  end
  describe "#edit" do
    # @categoryを作成
    before do
      @guardian = FactoryBot.create(:guardian, last_name: "テスト")
    end
    #未ログインユーザーの場合
    context "ログインユーザーではない" do
      it "302応答を返すことを確認" do
        # categoryのインスタンスを生成する為の情報を「guardian_params」に格納
        guardian_params = FactoryBot.create(:guardian)
        # 「categor_params」をGETで送信する
        get :edit, params: {id: @guardian.id, guardian: guardian_params }
        # レスポンスのステータスが「302（失敗）」であることを確認
        expect(response).to have_http_status "302"
      end
      it "サインインページに遷移することを確認" do
        # categoryのインスタンスを生成する為の情報を「category_params」に格納
        guardian_params = FactoryBot.create(:guardian)
        # 「categor_params」をGETで送信する
        get :edit, params: {id: @guardian.id, guardian: guardian_params }
        # ログインユーザー意外がeditアクションを行うとサインインページに遷移
        expect(response).to redirect_to "/guardians/sign_in"
      end
    end
    #ログイン済みの場合
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
        get :edit, params: {id: @guardian.id }
        expect(response).to be_successful
      end
      #200レスポンスを返すこと
      it "200レスポンスを返す" do
        # @Guardianとしてログイン
        sign_in @guardian
        # indexアクションを行うとレスポンスがあることを確認
        get :edit, params: {id: @guardian.id }
        expect(response).to have_http_status "200"
      end
    end
  end
  describe "#update" do
    # @categoryを作成
    before do
      @guardian = FactoryBot.create(:guardian, last_name: "テスト")
    end
    #未ログインユーザーの場合
    context "ログインユーザーではない" do
      it "302応答を返すことを確認" do
        # categoryのインスタンスを生成する為の情報を「guardian_params」に格納
        guardian_params = FactoryBot.create(:guardian)
        # 「categor_params」をGETで送信する
        patch :update, params: {id: @guardian.id, guardian: guardian_params }
        # レスポンスのステータスが「302（失敗）」であることを確認
        expect(response).to have_http_status "302"
      end
      it "サインインページに遷移することを確認" do
        # categoryのインスタンスを生成する為の情報を「category_params」に格納
        guardian_params = FactoryBot.create(:guardian)
        # 「categor_params」をGETで送信する
        patch :update, params: {id: @guardian.id, guardian: guardian_params }
        # ログインユーザー意外がeditアクションを行うとサインインページに遷移
        expect(response).to redirect_to "/guardians/sign_in"
      end
    end
    #ログイン済みの場合
    context "ログイン済みのユーザーの場合" do
      # ユーザーの作成
      before do
        @guardian = FactoryBot.create(:guardian)
      end

      #last_nameを更新できる
      it "last_nameを更新できることを確認" do
        # @Guardianとしてログイン
        sign_in @guardian
        # guardianのインスタンスを生成する為の情報を「guardian_params」に格納
        guardian_params = FactoryBot.attributes_for(:guardian, last_name: "テスト")
        # indexアクションを行うとレスポンスがあることを確認
        patch :update, params: {id: @guardian.id, guardian: guardian_params }
        expect(@guardian.reload.last_name).to eq "テスト"
      end
      #last_nameを更新後にリダイレクトすること
      it "last_nameを更新後にリダイレクトすること" do
        # @Guardianとしてログイン
        sign_in @guardian
        # guardianのインスタンスを生成する為の情報を「guardian_params」に格納
        guardian_params = FactoryBot.attributes_for(:guardian, last_name: "テスト")
        # indexアクションを行うとレスポンスがあることを確認
        patch :update, params: {id: @guardian.id, guardian: guardian_params }
        expect(response).to redirect_to guardians_home_path
      end
    end
  end
end