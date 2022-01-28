require 'rails_helper'

describe '[STEP2-1]管理者ログイン後の注文内容管理管理テスト' do
  let(:admin) { create(:admin) }
  let!(:order) { create(:order) }


  #管理者としてログイン後注文内容管理画面へ遷移する
  before do
    visit new_admin_session_path
    fill_in 'admin[email]', with: admin.email
    fill_in 'admin[password]', with: admin.password
    click_button 'ログイン'
    visit admins_orders_path
  end

  describe "注文内容管理管理画面のテスト"do
    it "注文内容管理管理画面に正しく遷移する" do
      expect(current_path).to eq admins_orders_path
    end
    it "注文一覧が表示されている" do
      expect(page).to have_content '注文一覧'
    end
    it '一覧に詳細リンクが存在する' do
      expect(page).to have_link "", href: "/admins/orders/#{order.id}"
    end
    it "クリックすると注文内容管理詳細画面に遷移する" do
      click_link order.created_at.strftime("%Y-%m-%d %H:%M")
      expect(current_path).to eq "/admins/orders/#{order.id}"
    end
  end

  describe "注文内容管理詳細画面のテスト" do
    before do
      visit admins_order_path(order)
    end
    it "注文内容管理詳細画面が正しく表示される" do
      expect(page).to have_content '注文者氏名'
      expect(page).to have_content 'メールアドレス'
      expect(page).to have_content '受付日'
      expect(page).to have_content '更新日'
      expect(page).to have_content '配送先名'
      expect(page).to have_content '商品合計'
      expect(page).to have_content '送料'
      expect(page).to have_content '請求金額'
      expect(page).to have_content '支払方法'
      expect(page).to have_content '商品お渡し'
      expect(page).to have_content '注文情報の更新'
      expect(page).to have_content '注文グッズ一覧'
    end

    it "更新・戻るボタンが存在する" do
      expect(page).to have_button '更新'
      expect(page).to have_link '戻る'
    end
    describe "注文内容管理編集成功のテスト"do
      before do
          visit admins_order_path(order)
          @order_old_order_status = order.order_status
          find("option[value='contact_complete']").select_option
          click_button '更新'
        end
        it 'order_statusが正しく更新される' do
          expect(order.reload.order_status).not_to eq @order_status
        end
        it 'リダイレクト先が注文内容詳細画面になっている' do
          expect(current_path).to eq admins_order_path(order)
        end
    end
  end


end