require 'rails_helper'

describe '[STEP2]管理者テスト' do

  describe '管理者のログイン後のテスト' do
    let(:admin) { create(:admin) }
    before do
      visit new_admin_session_path
      fill_in 'admin[email]', with: admin.email
      fill_in 'admin[password]', with: admin.password
      click_button 'ログイン'
    end
    context '管理者トップ画面テスト' do
      it "管理者のトップ画面に遷移する" do
        expect(current_path).to eq admins_root_path
      end
      it "ヘッダーに管理者ログアウトが表示されている" do
        logout_link = find_all('a')[1].native.inner_text
        expect(logout_link).to match(/管理者ログアウト/i)
      end
      it "「ログインしました。」の表示がある" do
        expect(page).to have_content 'ログインしました。'
      end
      it "管理者MENUが表示されている" do
        expect(page).to have_content '管理者MENU'
      end
    end

    context '管理者トップ画面のリンク内容の確認' do
      it 'カテゴリ管理画面へのリンクが存在する' do
        expect(page).to have_link 'カテゴリ管理', href: admins_categories_path
      end
      it '正しくカテゴリ管理画面へ遷移する' do
        click_link 'カテゴリ管理'
        expect(current_path).to eq admins_categories_path
      end
      it '選手・スタッフ管理画面へのリンクが存在する' do
        expect(page).to have_link '選手・スタッフ管理', href: admins_members_path
      end
      it '正しく選手・スタッフ管理画面へ遷移する' do
        click_link '選手・スタッフ管理'
        expect(current_path).to eq admins_members_path
      end
      it 'OB紹介管理画面へのリンクが存在する' do
        expect(page).to have_link 'OB紹介管理', href: admins_graduates_path
      end
      it '正しくOB紹介管理画面へ遷移する' do
        click_link 'OB紹介管理'
        expect(current_path).to eq admins_graduates_path
      end
      it 'スケジュール管理画面へのリンクが存在する' do
        expect(page).to have_link 'スケジュール管理', href: admins_events_path
      end
      it '正しくスケジュール管理画面へ遷移する' do
        click_link 'スケジュール管理'
        expect(current_path).to eq admins_events_path
      end
      it '試合結果管理画面へのリンクが存在する' do
        expect(page).to have_link '試合結果管理', href: admins_game_results_path
      end
      it '正しく試合結果管理画面へ遷移する' do
        click_link '試合結果管理'
        expect(current_path).to eq admins_game_results_path
      end
      it 'お知らせ管理画面へのリンクが存在する' do
        expect(page).to have_link 'お知らせ管理', href: admins_informations_path
      end
      it '正しくお知らせ管理画面へ遷移する' do
        click_link 'お知らせ管理'
        expect(current_path).to eq admins_informations_path
      end
      it '保護者専用お知らせ管理画面へのリンクが存在する' do
        expect(page).to have_link '保護者専用お知らせ管理', href: admins_information_for_guardians_path
      end
      it '正しく保護者専用お知らせ管理画面へ遷移する' do
        click_link '保護者専用お知らせ管理'
        expect(current_path).to eq admins_information_for_guardians_path
      end
      it '保護者管理画面へのリンクが存在する' do
        expect(page).to have_link '保護者管理', href: admins_guardians_path
      end
      it '正しく保護者管理画面へ遷移する' do
        click_link '保護者管理'
        expect(current_path).to eq admins_guardians_path
      end
      it '応援グッズ管理画面へのリンクが存在する' do
        expect(page).to have_link '応援グッズ管理', href: admins_items_path
      end
      it '正しく応援グッズ管理画面へ遷移する' do
        click_link '応援グッズ管理'
        expect(current_path).to eq admins_items_path
      end
      it '注文内容管理画面へのリンクが存在する' do
        expect(page).to have_link '注文内容管理', href: admins_orders_path
      end
      it '正しく注文内容管理画面へ遷移する' do
        click_link '注文内容管理'
        expect(current_path).to eq admins_orders_path
      end
      it 'お問い合わせ管理画面へのリンクが存在する' do
        expect(page).to have_link 'お問い合わせ管理', href: admins_contacts_path
      end
      it '正しくお問い合わせ管理画面へ遷移する' do
        click_link 'お問い合わせ管理'
        expect(current_path).to eq admins_contacts_path
      end
    end

  end
end
