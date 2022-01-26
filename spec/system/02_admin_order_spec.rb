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

  context "注文内容管理管理画面のテスト"do
    it "注文内容管理管理画面に正しく遷移する" do
      expect(current_path).to eq admins_orders_path
    end
    it "注文内容管理一覧が表示されている" do
      expect(page).to have_content '注文内容管理一覧'
    end
    it "注文内容管理を登録するボタンが存在する" do
      expect(page).to have_link '注文内容管理を登録する'
    end
    it '一覧に詳細リンクが存在する' do
      expect(page).to have_link '詳細', href: "/admins/orders/#{order.id}"
    end
    it "クリックすると注文内容管理詳細画面に遷移する" do
      click_link '詳細'
      expect(current_path).to eq "/admins/orders/#{order.id}"
    end
  end

  context "注文内容管理詳細画面のテスト" do
    before do
      visit admins_order_path(order)
    end
    it "注文内容管理詳細画面が正しく表示される" do
      expect(page).to have_content '商品名'
      expect(page).to have_content '単価（税抜）'
      expect(page).to have_content '内容'
    end

    it "編集・削除・戻るボタンが存在する" do
      expect(page).to have_link '編集'
      expect(page).to have_link '削除'
      expect(page).to have_link '戻る'
    end
  end

  context "注文内容管理編集画面のテスト"do
    before do
      visit edit_admins_order_path(order)
    end
    it "編集フォームが正しく表示されている" do
      expect(page).to have_field 'order[name]', with: order.name
      expect(page).to have_field 'order[introduction]', with: order.introduction
      expect(page).to have_field 'order[price]', with: order.price
      # expect(page).to have_field 'order[image_id]', with: order.image_id
    end
    it "変更・ボタンが存在する" do
      expect(page).to have_button '変更を保存'
    end
    #入力後「変更を保存」をクリックすると正しく更新される
    context "注文内容管理編集成功のテスト"do
      before do
        visit edit_admins_order_path(order)
        @order_old_name = order.name
        fill_in 'order[name]', with: Faker::Lorem.characters(number:10)
        click_button '変更を保存'
      end
      it 'nameが正しく更新される' do
        expect(order.reload.name).not_to eq @order_old_name
      end
      it 'リダイレクト先が注文内容管理管理画面になっている' do
        expect(current_path).to eq admins_order_path(order)
      end
    end
  end


  context "注文内容管理削除テスト" do
    before do
      order = create(:order, name: 'test')
      visit admins_order_path(order)
      click_link '削除'
    end
    context "注文内容管理削除の成功" do
      it '正しく削除される' do
        expect(page).not_to eq have_content 'test'
      end
      it 'リダイレクト先が注文内容管理管理画面になっている' do
        expect(current_path).to eq admins_orders_path
      end
    end
  end

end