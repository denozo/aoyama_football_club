require 'rails_helper'

describe '[STEP2-1]管理者ログイン後のお知らせ管理テスト' do
  let(:admin) { create(:admin) }
  let!(:information) { create(:information) }

  #管理者としてお知らせ管理画面へ遷移する
  before do
    visit new_admin_session_path
    fill_in 'admin[email]', with: admin.email
    fill_in 'admin[password]', with: admin.password
    click_button 'ログイン'
    visit admins_informations_path
  end

  context "お知らせ管理画面のテスト"do
    it "お知らせ管理画面に正しく遷移する" do
      expect(current_path).to eq admins_informations_path
    end
    it "お知らせ一覧が表示されている" do
      expect(page).to have_content 'お知らせ一覧'
    end
    it "お知らせを登録するボタンが存在する" do
      expect(page).to have_link 'お知らせを登録する'
    end
    it '一覧に詳細リンクが存在する' do
      expect(page).to have_link '詳細', href: "/admins/informations/#{information.id}"
    end
    it "クリックするとお知らせ詳細画面に遷移する" do
      click_link '詳細'
      expect(current_path).to eq "/admins/informations/#{information.id}"
    end
  end

  context "お知らせ詳細画面のテスト" do
    before do
      visit admins_information_path(information)
    end
    it "入力フォームが正しく表示される" do
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

  context "お知らせ新規登録画面のテスト"do
    before do
      visit new_admins_information_path(information)
    end
    it "入力フォームが正しく表示されている" do
      expect(page).to have_field 'information[title]'
      expect(page).to have_field 'information[content]'
      # expect(page).to have_field 'information[image_id]', with: information.image_id
    end
    it "入力フォームが空欄である" do
      expect(find_field('information[title]').text).to be_blank
      expect(find_field('information[content]').text).to be_blank
    end

    it "新規登録ボタンが存在する" do
      expect(page).to have_button '新規登録'
    end
    #入力後「変更を保存」をクリックすると正しく更新される
    context "お知らせ新規登録の成功のテスト"do
      before do
        visit new_admins_information_path
        information = create(:information)
        click_button '新規登録'
      end
      it 'リダイレクト先がお知らせ管理画面になっている' do
        expect(current_path).to eq "/admins/informations/"
      end
    end
  end

  context "お知らせ編集画面のテスト"do
    before do
      visit edit_admins_information_path(information)
    end
    it "編集フォームが正しく表示されている" do
      expect(page).to have_field 'information[title]', with: information.title
      expect(page).to have_field 'information[content]', with: information.content
    end
    it "変更・ボタンが存在する" do
      expect(page).to have_button '変更を保存'
    end
    #入力後「変更を保存」をクリックすると正しく更新される
    context "お知らせ編集成功のテスト"do
      before do
        visit edit_admins_information_path(information)
        @information_old_title = information.title
        fill_in 'information[title]', with: Faker::Lorem.characters(number:10)
        click_button '変更を保存'
      end
      it 'member_listが正しく更新される' do
        expect(information.reload.title).not_to eq @information_old_title
      end
      it 'リダイレクト先がお知らせ管理画面になっている' do
        expect(current_path).to eq admins_information_path(information)
      end
    end
  end


  context "お知らせ削除テスト" do
    before do
      information = create(:information, title: 'test')
      visit admins_information_path(information)
      click_link '削除'
    end
    context "お知らせ削除の成功" do
      it '正しく削除される' do
        expect(page).not_to eq have_content 'test'
      end
      it 'リダイレクト先がお知らせ管理画面になっている' do
        expect(current_path).to eq admins_informations_path
      end
    end
  end

end