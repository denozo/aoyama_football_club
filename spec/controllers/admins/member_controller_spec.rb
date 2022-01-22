require 'rails_helper'

describe Admins::MembersController, type: :controller do
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
    # @memberを作成
    before do
      @member = FactoryBot.create(:member)
    end
    #未ログインユーザーの場合
    context "ログインユーザーではない" do
      # showアクションのレスポンスのステータスが「302（失敗）」であることを確認
      it "302応答を返すことを確認" do
        get :show, params: {id: @member.id }
        expect(response).to have_http_status "302"
      end
      # ログインユーザー意外がindexアクションを行うとサインインページに遷移
      it "サインインページに遷移することを確認" do
        get :show, params: {id: @member.id }
        expect(response).to redirect_to "/admins/sign_in"
      end
    end
  end
  describe "#edit" do
    # @memberを作成
    before do
      @member = FactoryBot.create(:member, last_name: "テスト" )
    end
    #未ログインユーザーの場合
    context "ログインユーザーではない" do
      it "302応答を返すことを確認" do
        # memberのインスタンスを生成する為の情報を「member_params」に格納
        member_params = FactoryBot.create(:member)
        # 「member_params」をGETで送信する
        get :edit, params: {id: @member.id, member: member_params }
        # レスポンスのステータスが「302（失敗）」であることを確認
        expect(response).to have_http_status "302"
      end
      it "サインインページに遷移することを確認" do
        # memberのインスタンスを生成する為の情報を「member_params」に格納
        member_params = FactoryBot.create(:member)
        # 「member_params」をGETで送信する
        get :edit, params: {id: @member.id, member: member_params }
        # ログインユーザー意外がeditアクションを行うとサインインページに遷移
        expect(response).to redirect_to "/admins/sign_in"
      end
    end
  end
  describe "#update" do
    # @memberを作成
    before do
      @member = FactoryBot.create(:member, last_name: "テスト" )
    end
    #未ログインユーザーの場合
    context "ログインユーザーではない" do
      it "302応答を返すことを確認" do
        # memberのインスタンスを生成する為の情報を「member_params」に格納
        member_params = FactoryBot.attributes_for(:member)
        # 「member_params」をPATCHで送信する
        patch :update, params: {id: @member.id, member: member_params }
        # レスポンスのステータスが「302（失敗）」であることを確認
        expect(response).to have_http_status "302"
      end
      it "サインインページに遷移することを確認" do
        # memberのインスタンスを生成する為の情報を「member_params」に格納
        member_params = FactoryBot.attributes_for(:member)
        # 「member_params」をPATCHで送信する
        patch :update, params: {id: @member.id, member: member_params }
        # ログインユーザー意外がupdateアクションを行うとサインインページに遷移
        expect(response).to redirect_to "/admins/sign_in"
      end
    end
  end
  describe "#destroy" do
    # @memberを作成
    before do
      @member = FactoryBot.create(:member)
    end
    #未ログインユーザーの場合
    context "ログインユーザーではない" do
      it "302応答を返すことを確認" do
        # DELETEを@memberに送信する
        delete :destroy, params: {id: @member.id }
        # レスポンスのステータスが「302（失敗）」であることを確認
        expect(response).to have_http_status "302"
      end
      it "サインインページに遷移することを確認" do
        # DELETEを@memberに送信する
        delete :destroy, params: {id: @member.id }
        # ログインユーザー意外がupdateアクションを行うとサインインページに遷移
        expect(response).to redirect_to "/admins/sign_in"
      end
    end
  end
end