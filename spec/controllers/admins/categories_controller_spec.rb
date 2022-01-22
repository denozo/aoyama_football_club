require 'rails_helper'

describe Admins::CategoriesController, type: :controller do
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
        # categoryのインスタンスを生成する為の情報を「category_params」に格納
        category_params = FactoryBot.attributes_for(:category)
        # 「categor_params」をPOSTで送信する
        post :create, params: {category: category_params }
        # レスポンスのステータスが「302（失敗）」であることを確認
        expect(response).to have_http_status "302"
      end
      it "サインインページに遷移することを確認" do
        # categoryのインスタンスを生成する為の情報を「category_params」に格納
        category_params = FactoryBot.attributes_for(:category)
        # 「categor_params」をPOSTで送信する
        post :create, params: {category: category_params }
        # ログインユーザー意外がcreateアクションを行うとサインインページに遷移
        expect(response).to redirect_to "/admins/sign_in"
      end
    end
  end
  describe "#edit" do
    # @categoryを作成
    before do
      @category = FactoryBot.create(:category, category_name: "テスト")
    end
    #未ログインユーザーの場合
    context "ログインユーザーではない" do
      it "302応答を返すことを確認" do
        # categoryのインスタンスを生成する為の情報を「category_params」に格納
        category_params = FactoryBot.create(:category)
        # 「categor_params」をGETで送信する
        get :edit, params: {id: @category.id, category: category_params }
        # レスポンスのステータスが「302（失敗）」であることを確認
        expect(response).to have_http_status "302"
      end
      it "サインインページに遷移することを確認" do
        # categoryのインスタンスを生成する為の情報を「category_params」に格納
        category_params = FactoryBot.create(:category)
        # 「categor_params」をGETで送信する
        get :edit, params: {id: @category.id, category: category_params }
        # ログインユーザー意外がeditアクションを行うとサインインページに遷移
        expect(response).to redirect_to "/admins/sign_in"
      end
    end
  end
  describe "#update" do
    # @categoryを作成
    before do
      @category = FactoryBot.create(:category, category_name: "テスト")
    end
    #未ログインユーザーの場合
    context "ログインユーザーではない" do
      it "302応答を返すことを確認" do
        # categoryのインスタンスを生成する為の情報を「category_params」に格納
        category_params = FactoryBot.attributes_for(:category)
        # 「categor_params」をPATCHで送信する
        patch :update, params: {id: @category.id, category: category_params }
        # レスポンスのステータスが「302（失敗）」であることを確認
        expect(response).to have_http_status "302"
      end
      it "サインインページに遷移することを確認" do
        # categoryのインスタンスを生成する為の情報を「category_params」に格納
        category_params = FactoryBot.attributes_for(:category)
        # 「categor_params」をPATCHで送信する
        patch :update, params: {id: @category.id, category: category_params }
        # ログインユーザー意外がupdateアクションを行うとサインインページに遷移
        expect(response).to redirect_to "/admins/sign_in"
      end
    end
  end
  describe "#destroy" do
    # @categoryを作成
    before do
      @category = FactoryBot.create(:category)
    end
    #未ログインユーザーの場合
    context "ログインユーザーではない" do
      it "302応答を返すことを確認" do
        # DELETEを@categoryに送信する
        delete :destroy, params: {id: @category.id }
        # レスポンスのステータスが「302（失敗）」であることを確認
        expect(response).to have_http_status "302"
      end
      it "サインインページに遷移することを確認" do
        # DELETEを@categoryに送信する
        delete :destroy, params: {id: @category.id }
        # ログインユーザー意外がupdateアクションを行うとサインインページに遷移
        expect(response).to redirect_to "/admins/sign_in"
      end
    end
  end
end