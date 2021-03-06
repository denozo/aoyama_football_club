require 'rails_helper'

describe Admins::ContactsController, type: :controller do
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
    # @contactを作成
    before do
      @contact = FactoryBot.create(:contact )
    end
    #未ログインユーザーの場合
    context "ログインユーザーではない" do
      # showアクションのレスポンスのステータスが「302（失敗）」であることを確認
      it "302応答を返すことを確認" do
        get :show, params: {id: @contact.id }
        expect(response).to have_http_status "302"
      end
      # ログインユーザー意外がindexアクションを行うとサインインページに遷移
      it "サインインページに遷移することを確認" do
        get :show, params: {id: @contact.id }
        expect(response).to redirect_to "/admins/sign_in"
      end
    end
  end
  describe "#update" do
    # @contactを作成
    before do
      @contact = FactoryBot.create(:contact, answer_status: 1 )
    end
    #未ログインユーザーの場合
    context "ログインユーザーではない" do
      it "302応答を返すことを確認" do
        # contactのインスタンスを生成する為の情報を「contact_params」に格納
        contact_params = FactoryBot.attributes_for(:contact)
        # 「categor_params」をPATCHで送信する
        patch :update, params: {id: @contact.id, contact: contact_params }
        # updadeのレスポンスのステータスが「302（失敗）」であることを確認
        expect(response).to have_http_status "302"
      end
      it "サインインページに遷移することを確認" do
        # contactのインスタンスを生成する為の情報を「contact_params」に格納
        contact_params = FactoryBot.attributes_for(:contact)
        # 「contact_params」をPATCHで送信する
        patch :update, params: {id: @contact.id, category: contact_params }
        # ログインユーザー意外がupdateアクションを行うとサインインページに遷移
        expect(response).to redirect_to "/admins/sign_in"
      end
    end
  end
end