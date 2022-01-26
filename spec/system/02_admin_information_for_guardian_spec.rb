require 'rails_helper'

describe '[STEP2-1]管理者ログイン後の保護者専用お知らせ管理テスト' do
  let(:admin) { create(:admin) }
  let!(:information_for_guardian) { create(:information_for_guardian) }

  #管理者として保護者専用お知らせ管理画面へ遷移する
  before do
    visit new_admin_session_path
    fill_in 'admin[email]', with: admin.email
    fill_in 'admin[password]', with: admin.password
    click_button 'ログイン'
    visit admins_information_for_guardians_path
  end

  context "保護者専用お知らせ管理画面のテスト"do
    it "保護者専用お知らせ管理画面に正しく遷移する" do
      expect(current_path).to eq admins_information_for_guardians_path
    end
    it "保護者専用お知らせ一覧が表示されている" do
      expect(page).to have_content '保護者専用お知らせ一覧'
    end
    it "お知らせ登録ボタンが存在する" do
      expect(page).to have_link 'お知らせ登録'
    end
    it '一覧に詳細リンクが存在する' do
      expect(page).to have_link '詳細', href: "/admins/information_for_guardians/#{information_for_guardian.id}"
    end
    it "クリックすると保護者専用お知らせ詳細画面に遷移する" do
      click_link '詳細'
      expect(current_path).to eq "/admins/information_for_guardians/#{information_for_guardian.id}"
    end
  end

  context "保護者専用お知らせ詳細画面のテスト" do
    before do
      visit admins_information_for_guardian_path(information_for_guardian)
    end
    it "詳細画面の項目が正しく表示される" do
      expect(page).to have_content 'カテゴリー'
      expect(page).to have_content 'タイトル'
      expect(page).to have_content '内容'
    end

    it "編集・削除・戻るボタンが存在する" do
      expect(page).to have_link '編集'
      expect(page).to have_link '削除'
      expect(page).to have_link '戻る'
    end
  end

  context "保護者専用お知らせ新規登録画面のテスト"do
    before do
      visit new_admins_information_for_guardian_path(information_for_guardian)
    end
    it "入力フォームが正しく表示されている" do
      expect(page).to have_field 'information_for_guardian[title]'
      expect(page).to have_field 'information_for_guardian[content]'
      # expect(page).to have_field 'information_for_guardian[image_id]', with: information_for_guardian.image_id
    end
    it "入力フォームが空欄である" do
      expect(find_field('information_for_guardian[title]').text).to be_blank
      expect(find_field('information_for_guardian[content]').text).to be_blank
    end

    it "新規登録ボタンが存在する" do
      expect(page).to have_button '新規登録'
    end
    #入力後「変更を保存」をクリックすると正しく更新される
    context "保護者専用お知らせ新規登録の成功のテスト"do
      before do
        visit new_admins_information_for_guardian_path
        click_button '新規登録'
      end
      it 'リダイレクト先が保護者専用お知らせ管理画面になっている' do
        expect(current_path).to eq "/admins/information_for_guardians"
      end
    end
  end

  context "保護者専用お知らせ編集画面のテスト"do
    before do
      visit edit_admins_information_for_guardian_path(information_for_guardian)
    end
    it "編集フォームが正しく表示されている" do
      expect(page).to have_field 'information_for_guardian[title]', with: information_for_guardian.title
      expect(page).to have_field 'information_for_guardian[content]', with: information_for_guardian.content
    end
    it "変更・ボタンが存在する" do
      expect(page).to have_button '変更を保存'
    end
    #入力後「変更を保存」をクリックすると正しく更新される
    context "保護者専用お知らせ編集成功のテスト"do
      before do
        visit edit_admins_information_for_guardian_path(information_for_guardian)
        @information_for_guardian_old_title = information_for_guardian.title
        fill_in 'information_for_guardian[title]', with: Faker::Lorem.characters(number:10)
        click_button '変更を保存'
      end
      it 'titleが正しく更新される' do
        expect(information_for_guardian.reload.title).not_to eq @information_for_guardian_old_title
      end
      it 'リダイレクト先が保護者専用お知らせ管理画面になっている' do
        expect(current_path).to eq admins_information_for_guardian_path(information_for_guardian)
      end
    end
  end


  context "保護者専用お知らせ削除テスト" do
    before do
      information_for_guardian = create(:information_for_guardian, title: 'test')
      visit admins_information_for_guardian_path(information_for_guardian)
      click_link '削除'
    end
    context "保護者専用お知らせ削除の成功" do
      it '正しく削除される' do
        expect(page).not_to eq have_content 'test'
      end
      it 'リダイレクト先が保護者専用お知らせ管理画面になっている' do
        expect(current_path).to eq admins_information_for_guardians_path
      end
    end
  end

end