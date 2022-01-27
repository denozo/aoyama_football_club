require 'rails_helper'

#Visitorの動作テスト
describe '[STEP3]guardianのテスト' do

  describe '保護者専用のログイン前テスト' do

    describe '保護者アカウント作成の確認' do
      before do
        visit new_guardian_registration_path
      end

    end

    describe '保護者専用ログイン画面の確認' do
      before do
        visit new_guardian_session_path
      end
      it 'URLが正しい' do
        expect(current_path).to eq new_guardian_session_path
      end
      it 'ログイン画面が表示されている' do
        expect(page).to have_content '保護者ログイン'
      end
      it 'emailフォームが表示される' do
        expect(page).to have_field 'guardian[email]'
      end
      it 'passwordフォームが表示される' do
        expect(page).to have_field 'guardian[password]'
      end
      it 'ログインボタンが表示される' do
        expect(page).to have_button 'ログイン'
      end
    end

    # TOP画面の表示
    describe 'トップ画面の確認' do
      before do
        visit root_path
      end
      it 'トップ画面のURLが正しい' do
        expect(current_path).to eq '/'
      end
      # ヘッダーのリンクが正しいか
      it '「サッカー部について」のリンクが左から１番目に表示される' do
        about_link = find_all('a')[1].native.inner_text
        expect(about_link).to match(/サッカー部について/i)
      end
      it '「サッカー部について」のリンクの内容が正しい' do
        about_link = find_all('a')[1].native.inner_text
        expect(page).to have_link about_link, href: about_path
      end
      it '「選手・スタッフ」のリンクが左から２番目に表示される' do
        member_link = find_all('a')[2].native.inner_text
        expect(member_link).to match(/選手・スタッフ/i)
      end
      it '「選手・スタッフ」のリンクの内容が正しい' do
        member_link = find_all('a')[2].native.inner_text
        expect(page).to have_link member_link , href: members_path
      end
    end

  end #＝＝＝＝

  describe '保護者専用のログイン後テスト' do
    let(:guardian) { create(:guardian) }
    let!(:information_for_guardian) { create(:information_for_guardian) }

    before do
      visit new_guardian_session_path
      fill_in 'guardian[email]', with: guardian.email
      fill_in 'guardian[password]', with: guardian.password
      click_button 'ログイン'
    end

    describe '管理者トップ画面テスト' do
      it "管理者のトップ画面に正しく遷移する" do
        expect(current_path).to eq guardians_root_path
      end
      it "ヘッダーに登録情報が表示されている" do
        logout_link = find_all('a')[1].native.inner_text
        expect(logout_link).to match(/登録情報/i)
      end
      it "ヘッダーにログアウトが表示されている" do
        logout_link = find_all('a')[2].native.inner_text
        expect(logout_link).to match(/ログアウト/i)
      end
      it "保護者専用お知らせ一覧が表示されている" do
        expect(page).to have_content '保護者専用お知らせ一覧'
      end
      it '一覧に詳細リンクが存在する' do
      expect(page).to have_link '詳細', href: "/guardians/information_for_guardians/#{information_for_guardian.id}"
      end
      it "クリックするとお知らせ詳細画面に遷移する" do
        click_link '詳細'
        expect(current_path).to eq "/guardians/information_for_guardians/#{information_for_guardian.id}"
      end

      describe "保護者専用お知らせ詳細画面のテスト" do
        before do
          visit guardians_information_for_guardian_path(information_for_guardian)
        end
        it "詳細画面の項目が正しく表示される" do
          expect(page).to have_content 'カテゴリー'
          expect(page).to have_content 'タイトル'
          expect(page).to have_content '内容'
        end
        it "戻るボタンが存在する" do
          expect(page).to have_link '戻る'
        end
      end

      describe "登録情報の詳細画面のテスト" do
        before do
          visit guardians_home_path(guardian)
        end
        it "詳細画面の項目が正しく表示される" do
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
        it "編集ボタンが存在する" do
          expect(page).to have_link '編集'
        end
      end

      describe "保護者編集画面のテスト"do
        before do
          visit edit_guardians_home_path(guardian)
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
        describe "保護者編集成功のテスト"do
          before do
            visit edit_guardians_home_path(guardian)
            @guardian_old_last_name = guardian.last_name
            fill_in 'guardian[last_name]', with: Faker::Lorem.characters(number:10)
            click_button '変更を保存'
          end
          it 'last_nameが正しく更新される' do
            expect(guardian.reload.last_name).not_to eq @guardian_old_last_name
          end
          it 'リダイレクト先が保護者管理画面になっている' do
            expect(current_path).to eq guardians_home_path(guardian)
          end
        end
      end

    end
  end



end #＝＝＝＝