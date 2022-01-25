require 'rails_helper'

describe '[STEP2-1]管理者ログイン後スケジュール管理テスト' do
  let(:admin) { create(:admin) }
  let!(:event) { create(:event) }

  #管理者としてスケジュール管理画面へ遷移する
  before do
    visit new_admin_session_path
    fill_in 'admin[email]', with: admin.email
    fill_in 'admin[password]', with: admin.password
    click_button 'ログイン'
    visit admins_events_path
  end

  context "スケジュール管理画面のテスト"do
    it "スケジュール管理画面に正しく遷移する" do
      expect(current_path).to eq admins_events_path
    end
    it "スケジュール管理が表示されている" do
      expect(page).to have_content 'スケジュール管理'
    end
    it "スケジュールを登録するボタンが存在する" do
      expect(page).to have_link 'スケジュールを登録する'
    end
    it 'スケジュールにリンクが存在する' do
      expect(page).to have_link event.title, href: "/admins/events/#{event.id}"
    end
    it "クリックするとスケジュール詳細画面に遷移する" do
      click_link event.title
      expect(current_path).to eq "/admins/events/#{event.id}"
    end
  end

  context "スケジュール詳細画面のテスト" do
    before do
      visit admins_event_path(event)
    end
    it "入力フォームが正しく表示される" do
      expect(page).to have_content 'スケジュールタイトル'
      expect(page).to have_content '開始日時'
      expect(page).to have_content 'お問い合わせ内容'
    end

    it "編集・削除・戻るボタンが存在する" do
      expect(page).to have_link '編集'
      expect(page).to have_link '削除'
      expect(page).to have_link '戻る'
    end
  end

  context "スケジュール新規登録画面のテスト"do
    before do
      visit new_admins_event_path(event)
    end
    it "入力フォームが正しく表示されている" do
      expect(page).to have_field 'event[title]'
      expect(page).to have_field 'event[start_time]'
      expect(page).to have_field 'event[end_time]'
      expect(page).to have_field 'event[content]'
      # expect(page).to have_field 'event[image_id]', with: event.image_id
    end
    it "入力フォームが空欄である" do
      expect(find_field('event[title]').text).to be_blank
      expect(find_field('event[start_time]').text).to be_blank
      expect(find_field('event[end_time]').text).to be_blank
      expect(find_field('event[content]').text).to be_blank
    end

    it "新規登録ボタンが存在する" do
      expect(page).to have_button '新規登録'
    end
    #入力後「変更を保存」をクリックすると正しく更新される
    context "スケジュール新規登録の成功のテスト"do
      before do
        visit new_admins_event_path
        event = create(:event)
        click_button '新規登録'
      end
      it 'リダイレクト先がスケジュール管理画面になっている' do
        expect(current_path).to eq admins_events_path
      end
    end
  end

  context "スケジュール編集画面のテスト"do
    before do
      visit edit_admins_event_path(event)
    end
    it "編集フォームが正しく表示されている" do
      expect(page).to have_field 'event[title]', with: event.title
      expect(page).to have_field 'event[start_time]', with: event.start_time
      expect(page).to have_field 'event[end_time]', with: event.end_time
      expect(page).to have_field 'event[content]', with: event.content
    end
    it "変更を保存ボタンが存在する" do
      expect(page).to have_button '変更を保存'
    end
    #入力後「変更を保存」をクリックすると正しく更新される
    context "スケジュール編集成功のテスト"do
      before do
        visit edit_admins_event_path(event)
        @event_old_title = event.title
        fill_in 'event[title]', with: Faker::Lorem.characters(number:10)
        click_button '変更を保存'
      end
      it 'member_listが正しく更新される' do
        expect(event.reload.title).not_to eq  @event_old_title
      end
      it 'リダイレクト先がスケジュール管理画面になっている' do
        expect(current_path).to eq admins_event_path(event)
      end
    end
  end


  context "スケジュール削除テスト" do
    before do
      event = create(:event, title: 'test')
      visit admins_event_path(event)
      click_link '削除'
    end
    context "スケジュール削除の成功" do
      it '正しく削除される' do
        expect(page).not_to eq have_content 'test'
      end
      it 'リダイレクト先がスケジュール管理画面になっている' do
        expect(current_path).to eq admins_events_path
      end
    end
  end

end