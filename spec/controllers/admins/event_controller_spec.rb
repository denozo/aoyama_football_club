require 'rails_helper'

describe Admins::EventsController, type: :controller do
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
    # @eventを作成
    before do
      @event = FactoryBot.create(:event )
    end
    #未ログインユーザーの場合
    context "ログインユーザーではない" do
      # showアクションのレスポンスのステータスが「302（失敗）」であることを確認
      it "302応答を返すことを確認" do
        get :show, params: {id: @event.id }
        expect(response).to have_http_status "302"
      end
      # ログインユーザー意外がindexアクションを行うとサインインページに遷移
      it "サインインページに遷移することを確認" do
        get :show, params: {id: @event.id }
        expect(response).to redirect_to "/admins/sign_in"
      end
    end
  end
  describe "#create" do
    #未ログインユーザーの場合
    context "ログインユーザーではない" do
      it "302応答を返すことを確認" do
        # eventのインスタンスを生成する為の情報を「event_params」に格納
        event_params = FactoryBot.attributes_for(:event)
        # 「event_params」をPOSTで送信する
        post :create, params: {event: event_params }
        # レスポンスのステータスが「302（失敗）」であることを確認
        expect(response).to have_http_status "302"
      end
      it "サインインページに遷移することを確認" do
        # eventのインスタンスを生成する為の情報を「event_params」に格納
        event_params = FactoryBot.attributes_for(:event)
        # 「event_params」をPOSTで送信する
        post :create, params: {event: event_params }
        # ログインユーザー意外がcreateアクションを行うとサインインページに遷移
        expect(response).to redirect_to "/admins/sign_in"
      end
    end
  end
  describe "#edit" do
    # @eventを作成
    before do
      @event = FactoryBot.create(:event, title: "テスト")
    end
    #未ログインユーザーの場合
    context "ログインユーザーではない" do
      it "302応答を返すことを確認" do
        # eventのインスタンスを生成する為の情報を「event_params」に格納
        event_params = FactoryBot.create(:event)
        # 「event_params」をGETで送信する
        get :edit, params: {id: @event.id, event: event_params }
        # レスポンスのステータスが「302（失敗）」であることを確認
        expect(response).to have_http_status "302"
      end
      it "サインインページに遷移することを確認" do
        # eventのインスタンスを生成する為の情報を「event_params」に格納
        event_params = FactoryBot.create(:event)
        # 「event_params」をGETで送信する
        get :edit, params: {id: @event.id, event: event_params }
        # ログインユーザー意外がeditアクションを行うとサインインページに遷移
        expect(response).to redirect_to "/admins/sign_in"
      end
    end
  end
  describe "#update" do
    # @eventを作成
    before do
      @event = FactoryBot.create(:event, title: "テスト")
    end
    #未ログインユーザーの場合
    context "ログインユーザーではない" do
      it "302応答を返すことを確認" do
        # eventのインスタンスを生成する為の情報を「event_params」に格納
        event_params = FactoryBot.attributes_for(:event)
        # 「event_params」をPATCHで送信する
        patch :update, params: {id: @event.id, event: event_params }
        # レスポンスのステータスが「302（失敗）」であることを確認
        expect(response).to have_http_status "302"
      end
      it "サインインページに遷移することを確認" do
        # eventのインスタンスを生成する為の情報を「event_params」に格納
        event_params = FactoryBot.attributes_for(:event)
        # 「event_params」をPATCHで送信する
        patch :update, params: {id: @event.id, event: event_params }
        # ログインユーザー意外がupdateアクションを行うとサインインページに遷移
        expect(response).to redirect_to "/admins/sign_in"
      end
    end
  end
  describe "#destroy" do
    # @eventを作成
    before do
      @event = FactoryBot.create(:event)
    end
    #未ログインユーザーの場合
    context "ログインユーザーではない" do
      it "302応答を返すことを確認" do
        # DELETEを@eventに送信する
        delete :destroy, params: {id: @event.id }
        # レスポンスのステータスが「302（失敗）」であることを確認
        expect(response).to have_http_status "302"
      end
      it "サインインページに遷移することを確認" do
        # DELETEを@eventに送信する
        delete :destroy, params: {id: @event.id }
        # ログインユーザー意外がupdateアクションを行うとサインインページに遷移
        expect(response).to redirect_to "/admins/sign_in"
      end
    end
  end
end