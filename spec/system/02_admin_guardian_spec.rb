require 'rails_helper'

describe '[STEP2-1]管理者ログイン後の保護者管理テスト' do
  let(:admin) { create(:admin) }
  let!(:guardian) { create(:guardian) }

  #管理者として保護者管理画面へ遷移する
  before do
    visit new_admin_session_path
    fill_in 'admin[email]', with: admin.email
    fill_in 'admin[password]', with: admin.password
    click_button 'ログイン'
    visit admins_guardians_path
  end

  context "保護者管理画面のテスト"do
    it "保護者管理画面に正しく遷移する" do
      expect(current_path).to eq admins_guardians_path
    end
    it "保護者一覧が表示されている" do
      expect(page).to have_content '保護者一覧'
    end
    it '一覧に詳細リンクが存在する' do
      expect(page).to have_link "詳細", href: "/admins/guardians/#{guardian.id}"
    end
    it "クリックすると保護者詳細画面に遷移する" do
      click_link "詳細"
      expect(current_path).to eq "/admins/guardians/#{guardian.id}"
    end
  end

  context "保護者詳細画面のテスト" do
    before do
      visit admins_guardian_path(guardian)
    end
    it "詳細画面の正しく表示される" do
      expect(page).to have_content '保護者氏名'
      expect(page).to have_content 'フリガナ'
      expect(page).to have_content '生徒氏名'
      expect(page).to have_content '入学年度'
      expect(page).to have_content '続柄'
      expect(page).to have_content '郵便番号'
      expect(page).to have_content '住所'
      expect(page).to have_content '電話番号'
      expect(page).to have_content 'メールアドレス'
    end

    it "編集・削除・戻るボタンが存在する" do
      expect(page).to have_link '編集'
      expect(page).to have_link '削除'
      expect(page).to have_link '戻る'
    end
  end

  context "保護者編集画面のテスト"do
    before do
      visit edit_admins_guardian_path(guardian)
    end
    it "編集フォームが正しく表示されている" do
      expect(page).to have_field 'guardian[last_name]', with: guardian.last_name
      expect(page).to have_field 'guardian[first_name]', with: guardian.first_name
      expect(page).to have_field 'guardian[last_name_kana]', with: guardian.last_name_kana
      expect(page).to have_field 'guardian[first_name_kana]', with: guardian.first_name_kana
      expect(page).to have_field 'guardian[member_name]', with: guardian.member_name
      expect(page).to have_field 'guardian[relationship]', with: guardian.relationship
      expect(page).to have_field 'guardian[year_of_enrollment]', with: guardian.year_of_enrollment
      expect(page).to have_field 'guardian[postal_code]', with: guardian.postal_code
      expect(page).to have_field 'guardian[address]', with: guardian.address
      expect(page).to have_field 'guardian[tel]', with: guardian.tel
    end
    it "変更・ボタンが存在する" do
      expect(page).to have_button '変更を保存'
    end
    #入力後「変更を保存」をクリックすると正しく更新される
    context "保護者編集成功のテスト"do
      before do
        visit edit_admins_guardian_path(guardian)
        @guardian_old_last_name = guardian.last_name
        fill_in 'guardian[last_name]', with: Faker::Lorem.characters(number:10)
        click_button '変更を保存'
      end
      it 'last_nameが正しく更新される' do
        expect(guardian.reload.last_name).not_to eq @guardian_old_last_name
      end
      it 'リダイレクト先が保護者管理画面になっている' do
        expect(current_path).to eq admins_guardian_path(guardian)
      end
    end
  end


  context "保護者削除テスト" do
    before do
      guardian = create(:guardian, last_name: 'test')
      visit admins_guardian_path(guardian)
      click_link '削除'
    end
    context "保護者削除の成功" do
      it '正しく削除される' do
        expect(page).not_to eq have_content 'test'
      end
      it 'リダイレクト先が保護者管理画面になっている' do
        expect(current_path).to eq admins_guardians_path
      end
    end
  end

end