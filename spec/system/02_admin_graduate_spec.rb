require 'rails_helper'

describe '[STEP2-1]管理者ログイン後のOB紹介管理テスト' do
  let(:admin) { create(:admin) }
  let!(:graduate) { create(:graduate) }

  #管理者としてOB紹介管理画面へ遷移する
  before do
    visit new_admin_session_path
    fill_in 'admin[email]', with: admin.email
    fill_in 'admin[password]', with: admin.password
    click_button 'ログイン'
    visit admins_graduates_path
  end

  context "OB紹介管理画面のテスト"do
    it "OB紹介管理画面に正しく遷移する" do
      expect(current_path).to eq admins_graduates_path
    end
    it "OB紹介一覧が表示されている" do
      expect(page).to have_content 'OB紹介一覧'
    end
    it "OB紹介を登録するボタンが存在する" do
      expect(page).to have_link 'OB紹介を登録する'
    end
    it '一覧に詳細リンクが存在する' do
      expect(page).to have_link '詳細', href: "/admins/graduates/#{graduate.id}"
    end
    it "クリックするとOB紹介詳細画面に遷移する" do
      click_link '詳細'
      expect(current_path).to eq "/admins/graduates/#{graduate.id}"
    end
  end

  context "OB紹介詳細画面のテスト" do
    before do
      visit admins_graduate_path(graduate)
    end
    it "入力フォームが正しく表示される" do
      expect(page).to have_content '卒業年度'
      expect(page).to have_content 'メンバー一覧'
      expect(page).to have_content '主な進路'
    end

    it "編集・削除・戻るボタンが存在する" do
      expect(page).to have_link '編集'
      expect(page).to have_link '削除'
      expect(page).to have_link '戻る'
    end
  end

  context "OB紹介新規登録画面のテスト"do
    before do
      visit new_admins_graduate_path(graduate)
    end
    it "入力フォームが正しく表示されている" do
      expect(page).to have_field 'graduate[year]'
      expect(page).to have_field 'graduate[member_list]'
      expect(page).to have_field 'graduate[career_after_graduation]'
      # expect(page).to have_field 'graduate[image_id]', with: graduate.image_id
    end
    it "入力フォームが空欄である" do
      expect(find_field('graduate[year]').text).to be_blank
      expect(find_field('graduate[member_list]').text).to be_blank
      expect(find_field('graduate[career_after_graduation]').text).to be_blank
    end

    it "新規登録ボタンが存在する" do
      expect(page).to have_button '新規登録'
    end
    #入力後「変更を保存」をクリックすると正しく更新される
    context "OB紹介新規登録の成功のテスト"do
      before do
        visit new_admins_graduate_path
        graduate = create(:graduate)
        click_button '新規登録'
      end
      it 'リダイレクト先がOB紹介管理画面になっている' do
        expect(current_path).to eq admins_graduates_path
      end
    end
  end

  context "OB紹介編集画面のテスト"do
    before do
      visit edit_admins_graduate_path(graduate)
    end
    it "編集フォームが正しく表示されている" do
      expect(page).to have_field 'graduate[year]', with: graduate.year
      expect(page).to have_field 'graduate[member_list]', with: graduate.member_list
      expect(page).to have_field 'graduate[career_after_graduation]', with: graduate.career_after_graduation
      # expect(page).to have_field 'graduate[image_id]', with: graduate.image_id
    end
    it "変更・ボタンが存在する" do
      expect(page).to have_button '変更を保存'
    end
    #入力後「変更を保存」をクリックすると正しく更新される
    context "OB紹介編集成功のテスト"do
      before do
        visit edit_admins_graduate_path(graduate)
        @graduate_old_member_list = graduate.member_list
        fill_in 'graduate[member_list]', with: Faker::Lorem.characters(number:10)
        click_button '変更を保存'
      end
      it 'member_listが正しく更新される' do
        expect(graduate.reload.member_list).not_to eq @graduate_old_member_list
      end
      it 'リダイレクト先がOB紹介管理画面になっている' do
        expect(current_path).to eq admins_graduate_path(graduate)
      end
    end
  end


  context "OB紹介削除テスト" do
    before do
      graduate = create(:graduate, member_list: 'test')
      visit admins_graduate_path(graduate)
      click_link '削除'
    end
    context "OB紹介削除の成功" do
      it '正しく削除される' do
        expect(page).not_to eq have_content 'test'
      end
      it 'リダイレクト先がOB紹介管理画面になっている' do
        expect(current_path).to eq admins_graduates_path
      end
    end
  end

end