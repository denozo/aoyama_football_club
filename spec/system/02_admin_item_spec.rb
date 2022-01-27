require 'rails_helper'

describe '[STEP2-1]管理者ログイン後の応援グッズ管理テスト' do
  let(:admin) { create(:admin) }
  let!(:item) { create(:item) }


  #管理者としてログイン後応援グッズ画面へ遷移する
  before do
    visit new_admin_session_path
    fill_in 'admin[email]', with: admin.email
    fill_in 'admin[password]', with: admin.password
    click_button 'ログイン'
    visit admins_items_path
  end

  describe "応援グッズ管理画面のテスト"do
    it "応援グッズ管理画面に正しく遷移する" do
      expect(current_path).to eq admins_items_path
    end
    it "応援グッズ一覧が表示されている" do
      expect(page).to have_content '応援グッズ一覧'
    end
    it "応援グッズを登録するボタンが存在する" do
      expect(page).to have_link '応援グッズを登録する'
    end
    it '一覧に詳細リンクが存在する' do
      expect(page).to have_link '詳細', href: "/admins/items/#{item.id}"
    end
    it "クリックすると応援グッズ詳細画面に遷移する" do
      click_link '詳細'
      expect(current_path).to eq "/admins/items/#{item.id}"
    end
  end

  describe "応援グッズ詳細画面のテスト" do
    before do
      visit admins_item_path(item)
    end
    it "応援グッズ詳細画面が正しく表示される" do
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

  describe "応援グッズ新規登録画面のテスト"do
    before do
      visit new_admins_item_path(item)
    end
    it "入力フォームが正しく表示されている" do
      expect(page).to have_field 'item[name]'
      expect(page).to have_field 'item[introduction]'
      expect(page).to have_field 'item[price]'
      # expect(page).to have_field 'item[image_id]', with: item.image_id
    end
    it "入力フォームが空欄である" do
      expect(find_field('item[name]').text).to be_blank
      expect(find_field('item[introduction]').text).to be_blank
      expect(find_field('item[price]').text).to be_blank
    end

    it "登録するボタンが存在する" do
      expect(page).to have_button '登録する'
    end
    #入力後「変更を保存」をクリックすると正しく更新される
    describe "応援グッズ新規登録の成功のテスト"do
      before do
        visit new_admins_item_path
        click_button '登録する'
      end
      it 'リダイレクト先が応援グッズ管理画面になっている' do
        expect(current_path).to eq admins_items_path
      end
    end
  end

  describe "応援グッズ編集画面のテスト"do
    before do
      visit edit_admins_item_path(item)
    end
    it "編集フォームが正しく表示されている" do
      expect(page).to have_field 'item[name]', with: item.name
      expect(page).to have_field 'item[introduction]', with: item.introduction
      expect(page).to have_field 'item[price]', with: item.price
    end
    it "変更・ボタンが存在する" do
      expect(page).to have_button '変更を保存'
    end
    #入力後「変更を保存」をクリックすると正しく更新される
    describe "応援グッズ編集成功のテスト"do
      before do
        visit edit_admins_item_path(item)
        @item_old_name = item.name
        fill_in 'item[name]', with: Faker::Lorem.characters(number:10)
        click_button '変更を保存'
      end
      it 'nameが正しく更新される' do
        expect(item.reload.name).not_to eq @item_old_name
      end
      it 'リダイレクト先が応援グッズ管理画面になっている' do
        expect(current_path).to eq admins_item_path(item)
      end
    end
  end


  describe "応援グッズ削除テスト" do
    before do
      item = create(:item, name: 'test')
      visit admins_item_path(item)
      click_link '削除'
    end
    describe "応援グッズ削除の成功" do
      it '正しく削除される' do
        expect(page).not_to eq have_content 'test'
      end
      it 'リダイレクト先が応援グッズ管理画面になっている' do
        expect(current_path).to eq admins_items_path
      end
    end
  end

end