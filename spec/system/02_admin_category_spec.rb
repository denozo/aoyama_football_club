require 'rails_helper'

describe '[STEP2-1]管理者ログイン後のカテゴリ管理テスト' do
  let(:admin) { create(:admin) }
  let!(:category) { create(:category) }
  
  #管理者としてログイン後カテゴリ画面へ遷移する
  before do
    visit new_admin_session_path
    fill_in 'admin[email]', with: admin.email
    fill_in 'admin[password]', with: admin.password
    click_button 'ログイン'
    visit admins_categories_path
  end

  context "カテゴリ画面のテスト"do
    it "カテゴリ管理画面に正しく遷移する" do
      expect(current_path).to eq admins_categories_path
    end
    it "カテゴリの名称が表示されている" do
      expect(page).to have_content 'カテゴリの名称'
    end
    it 'category_nameフォームが表示される' do
      expect(page).to have_field 'category[category_name]'
    end
    it 'category_nameフォームに値が入っていない' do
      expect(find_field('category[category_name]').text).to be_blank
    end
    it "新規追加ボタンが存在する" do
      expect(page).to have_button '新規追加'
    end
    it '一覧に編集リンクが存在する' do
      expect(page).to have_link '編集する', href: edit_admins_category_path(category)
    end
    it "クリックするとカテゴリ編集画面に遷移する" do
      click_link "編集する"
      expect(current_path).to eq edit_admins_category_path(category)
    end
  end

  context "カテゴリ編集画面のテスト"do
    before do
      visit edit_admins_category_path(category)
    end
    it "編集フォームが正しく表示されている" do
      expect(page).to have_field 'category[category_name]', with: category.category_name
    end
    it "変更を保存ボタンが存在する" do
      expect(page).to have_button '変更を保存'
    end
    #入力後「変更を保存」をクリックすると正しく更新される
    context "カテゴリ編集成功のテスト"do
      before do
        visit edit_admins_category_path(category)
        @category_old_category_name = category.category_name
        fill_in 'category[category_name]', with: Faker::Lorem.characters(number:10)
        click_button '変更を保存'
      end
      it 'category_nameが正しく更新される' do
        expect(category.reload.category_name).not_to eq @category_old_category_name
      end
      it 'リダイレクト先がカテゴリ管理画面になっている' do
        expect(current_path).to eq admins_categories_path
      end
    end
  end
  
  
  context "カテゴリ削除テスト" do
    let!(:category) { create(:category, category_name: 'test') }
    before do
      click_link '削除する'
    end
    context "カテゴリ削除の成功" do
      it '正しく削除される' do
        expect(page).not_to eq have_content 'test'
      end
      it 'リダイレクト先がカテゴリ画面になっている' do
        expect(current_path).to eq admins_categories_path
      end
    end
  end

end