require 'rails_helper'

#Visitorの動作テスト
describe '[STEP1]Visitorのテスト' do
  describe 'サイト訪問者の画面テスト' do

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
      it '「OB紹介」のリンクが左から３番目に表示される' do
        graduate_link = find_all('a')[3].native.inner_text
        expect(graduate_link).to match(/OB紹介/i)
      end
      it '「OB紹介」のリンクの内容が正しい' do
        graduate_link = find_all('a')[3].native.inner_text
        expect(page).to have_link graduate_link , href: graduates_path
      end
      it '「お知らせ」のリンクが左から４番目に表示される' do
        info_link = find_all('a')[4].native.inner_text
        expect(info_link).to match(/お知らせ/i)
      end
      it '「お知らせ」のリンクの内容が正しい' do
        info_link = find_all('a')[4].native.inner_text
        expect(page).to have_link info_link , href: informations_path
      end
      it '「スケジュール」のリンクが左から５番目に表示される' do
        event_link = find_all('a')[5].native.inner_text
        expect(event_link).to match(/スケジュール/i)
      end
      it '「スケジュール」のリンクの内容が正しい' do
        event_link = find_all('a')[5].native.inner_text
        expect(page).to have_link event_link , href: events_path
      end
      it '「試合結果」のリンクが左から６番目に表示される' do
        game_result_link = find_all('a')[6].native.inner_text
        expect(game_result_link).to match(/試合結果/i)
      end
      it '「スケジュール」のリンクの内容が正しい' do
        game_result_link = find_all('a')[6].native.inner_text
        expect(page).to have_link game_result_link , href: game_results_path
      end
      it '「応援グッズ」のリンクが左から７番目に表示される' do
        item_link = find_all('a')[7].native.inner_text
        expect(item_link).to match(/応援グッズ/i)
      end
      it '「応援グッズ」のリンクの内容が正しい' do
        item_link = find_all('a')[7].native.inner_text
        expect(page).to have_link item_link , href: items_path
      end
      it '「カート」のリンクが左から８番目に表示される' do
        cart_link = find_all('a')[8].native.inner_text
        expect(cart_link).to match(/カート/i)
      end
      it '「カート」のリンクの内容が正しい' do
        cart_link = find_all('a')[8].native.inner_text
        expect(page).to have_link cart_link , href: cart_items_path
      end
      it '「保護者専用」のリンクが左から９番目に表示される' do
        guardian_link = find_all('a')[9].native.inner_text
        expect(guardian_link).to match(/保護者専用/i)
      end
      it '「保護者専用」のリンクの内容が正しい' do
        guardian_link = find_all('a')[9].native.inner_text
        expect(page).to have_link guardian_link , href: new_guardian_session_path
      end
    end

    # サッカー部について画面のテスト
    describe 'サッカー部についての画面の確認' do
      before do
        visit about_path
      end
      it 'サッカー部についてのURLが正しい' do
        expect(current_path).to eq about_path
      end
    end

    # 選手・スタッフ画面のテスト
    describe '選手・スタッフ画面の確認' do
      before do
        visit members_path
      end
      it 'URLが正しい' do
        expect(current_path).to eq members_path
      end
      it '選手・スタッフが表示される' do
        expect(page).to have_content '選手・スタッフ一覧'
      end
    end
    # 選手・スタッフ詳細画面のテスト
    describe "スケジュール詳細画面のテスト" do
      let!(:member) { create(:member) }
      before do
        visit member_path(member)
      end
      it "詳細画面に項目が正しく表示される" do
        # expect(page).to have_content 'ここに記述'
      end
      it "戻るボタンが存在する" do
        expect(page).to have_link '戻る'
      end
    end

    # OB紹介画面のテスト
    describe 'OB紹介画面の確認' do
      before do
        visit graduates_path
      end
      it 'URLが正しい' do
        expect(current_path).to eq graduates_path
      end
      it 'OB紹介が表示される' do
        expect(page).to have_content 'OB紹介'
      end
    end
    # OB紹介詳細画面のテスト
    describe "スケジュール詳細画面のテスト" do
      let!(:graduate) { create(:graduate) }
      before do
        visit graduate_path(graduate)
      end
      it "詳細画面に項目が正しく表示される" do
        # expect(page).to have_content 'ここに記述'
      end
      it "戻るボタンが存在する" do
        expect(page).to have_link '戻る'
      end
    end

    # お知らせ画面のテスト
    describe 'お知らせ画面の確認' do
      before do
        visit informations_path
      end
      it 'URLが正しい' do
        expect(current_path).to eq informations_path
      end
      it 'お知らせ一覧が表示される' do
        expect(page).to have_content 'お知らせ一覧'
      end
    end
    # お知らせ詳細画面のテスト
    describe "スケジュール詳細画面のテスト" do
      let!(:information) { create(:information) }
      before do
        visit information_path(information)
      end
      it "詳細画面に項目が正しく表示される" do
        # expect(page).to have_content 'ここに記述'
      end
      it "戻るボタンが存在する" do
        expect(page).to have_link '戻る'
      end
    end

    # スケジュール画面のテスト
    describe 'スケジュール画面の確認' do
      before do
        visit events_path
      end
      it 'URLが正しい' do
        expect(current_path).to eq events_path
      end
      it 'スケジュール管理が表示される' do
        expect(page).to have_content 'スケジュール管理'
      end
    end
    # スケジュール詳細画面のテスト
    describe "スケジュール詳細画面のテスト" do
      let!(:event) { create(:event) }
      before do
        visit event_path(event)
      end
      it "詳細画面に項目が正しく表示される" do
        # expect(page).to have_content 'ここに記述'
      end
      it "戻るボタンが存在する" do
        expect(page).to have_link '戻る'
      end
    end

    # 試合結果画面のテスト
    describe '試合結果画面の確認' do
      before do
        visit game_results_path
      end
      it 'URLが正しい' do
        expect(current_path).to eq game_results_path
      end
      it '試合結果が表示される' do
        expect(page).to have_content '試合結果'
      end
    end
    # 試合結果詳細画面のテスト
    describe "試合結果詳細画面のテスト" do
      let!(:game_result) { create(:game_result) }
      before do
        visit game_result_path(game_result)
      end
      it "詳細画面に項目が正しく表示される" do
        # expect(page).to have_content 'ここに記述'
      end
      it "戻るボタンが存在する" do
        expect(page).to have_link '戻る'
      end
    end

    # 応援グッズ画面のテスト
    describe '応援グッズ画面の確認' do
      before do
        visit items_path
      end
      it 'URLが正しい' do
        expect(current_path).to eq items_path
      end
      it '応援グッズが表示される' do
        expect(page).to have_content '青山高校サッカー部応援グッズ'
      end
    end
    # 応援グッズ詳細画面のテスト
    describe "応援グッズ詳細画面のテスト" do
      let!(:item) { create(:item) }
      before do
        visit item_path(item)
      end
      it "詳細画面に項目が正しく表示される" do
        # expect(page).to have_content 'ここに記述'
      end
      it "カートに入れると戻るボタンが存在する" do
        expect(page).to have_button 'カートに入れる'
        expect(page).to have_link '戻る'
      end
    end

    # カート画面のテスト
    describe 'カート画面の確認' do
      before do
        visit cart_items_path
      end
      it 'URLが正しい' do
        expect(current_path).to eq cart_items_path
      end
      it 'カートが表示される' do
        expect(page).to have_content 'カート内商品'
      end
      it 'カートを空にするリンクボタンが表示されリンク先が正しい' do
        expect(page).to have_link 'カートを空にする', href: destroyall_cart_items_path
      end
      it '注文内容入力に進むリンクボタンが表示されリンク先が正しい' do
        expect(page).to have_link '注文内容入力に進む', href: new_order_path
      end
    end
    
    # # 応援グッズ詳細画面のテスト
    # describe "スケジュール詳細画面のテスト" do
    #   let!(:item) { create(:item) }
    #   before do
    #     visit item_path(item)
    #   end
    #   it "詳細画面に項目が正しく表示される" do
    #     # expect(page).to have_content 'ここに記述'
    #   end
    #   it "戻るボタンが存在する" do
    #     expect(page).to have_link '戻る'
    #   end
    # end

    # 保護者専用画面のテスト
    # describe '保護者専用ログイン画面の確認' do
    #   before do
    #     visit new_guardian_session_path
    #   end
    #   it 'URLが正しい' do
    #     expect(current_path).to eq new_guardian_session_path
    #   end
    #   it 'ログイン画面が表示されている' do
    #     expect(page).to have_content '保護者ログイン'
    #   end
    #   it 'emailフォームが表示される' do
    #     expect(page).to have_field 'guardian[email]'
    #   end
    #   it 'passwordフォームが表示される' do
    #     expect(page).to have_field 'guardian[password]'
    #   end
    #   it 'ログインボタンが表示される' do
    #     expect(page).to have_button 'ログイン'
    #   end
    # end

  end #＝＝＝＝
end #＝＝＝＝