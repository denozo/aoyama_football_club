require 'rails_helper'

describe '[STEP2-1]管理者ログイン後の選手・スタッフ管理テスト' do
  let(:admin) { create(:admin) }
  let!(:member) { create(:member) }

  #管理者としてログイン後選手・スタッフ画面へ遷移する
  before do
    visit new_admin_session_path
    fill_in 'admin[email]', with: admin.email
    fill_in 'admin[password]', with: admin.password
    click_button 'ログイン'
    visit admins_members_path
  end

  context "選手・スタッフ管理画面のテスト"do
    it "選手・スタッフ管理画面に正しく遷移する" do
      expect(current_path).to eq admins_members_path
    end
    it "選手・スタッフ一覧が表示されている" do
      expect(page).to have_content '選手・スタッフ一覧'
    end
    it "選手・スタッフを登録するボタンが存在する" do
      expect(page).to have_link '選手・スタッフを登録する'
    end
    it '一覧に編集リンク(メンバー氏名)が存在する' do
      expect(page).to have_link member.last_name + " " + member.first_name, href: "/admins/members/#{member.id}"
    end
    it "クリックすると選手・スタッフ詳細画面に遷移する" do
      click_link member.last_name + " " + member.first_name
      expect(current_path).to eq "/admins/members/#{member.id}"
    end
  end

  context "選手・スタッフ詳細画面のテスト" do
    before do
      visit admins_member_path(member)
    end
    it "入力フォームが正しく表示される" do
      expect(page).to have_content '氏名'
      expect(page).to have_content '学年'
      expect(page).to have_content 'ポジション'
      expect(page).to have_content '身長'
      expect(page).to have_content '体重'
      expect(page).to have_content '出身チーム'
      expect(page).to have_content '趣味'
      expect(page).to have_content '目標'
    end

    it "編集・削除・戻るボタンが存在する" do
      expect(page).to have_link '編集'
      expect(page).to have_link '削除'
      expect(page).to have_link '戻る'
    end
  end

  context "選手・スタッフ新規登録画面のテスト"do
    before do
      visit new_admins_member_path(member)
    end
    it "入力フォームが正しく表示されている" do
      expect(page).to have_field 'member[last_name]'
      expect(page).to have_field 'member[first_name]'
      expect(page).to have_field 'member[last_name_kana]'
      expect(page).to have_field 'member[first_name_kana]'
      expect(page).to have_field 'member[position]'
      expect(page).to have_field 'member[height]'
      expect(page).to have_field 'member[weight]'
      expect(page).to have_field 'member[original_team]'
      expect(page).to have_field 'member[hobby]'
      expect(page).to have_field 'member[goal]'
      # expect(page).to have_field 'member[image_id]', with: member.image_id
    end
    it "入力フォームが空欄である" do
      expect(find_field('member[last_name]').text).to be_blank
      expect(find_field('member[first_name]').text).to be_blank
      expect(find_field('member[last_name_kana]').text).to be_blank
      expect(find_field('member[first_name_kana]').text).to be_blank
      expect(find_field('member[first_name_kana]').text).to be_blank
      expect(find_field('member[position]').text).to be_blank
      expect(find_field('member[height]').text).to be_blank
      expect(find_field('member[weight]').text).to be_blank
      expect(find_field('member[weight]').text).to be_blank
      expect(find_field('member[hobby]').text).to be_blank
      expect(find_field('member[goal]').text).to be_blank
    end

    it "登録するボタンが存在する" do
      expect(page).to have_button '登録する'
    end
    #入力後「変更を保存」をクリックすると正しく更新される
    context "カテゴリ新規登録の成功のテスト"do
      before do
        visit new_admins_member_path
        member = create(:member)
        click_button '登録する'
      end
      it 'リダイレクト先が選手・スタッフ管理画面になっている' do
        expect(current_path).to eq admins_members_path
      end
    end
  end

  context "選手・スタッフ編集画面のテスト"do
    before do
      visit edit_admins_member_path(member)
    end
    it "編集フォームが正しく表示されている" do
      expect(page).to have_field 'member[last_name]', with: member.last_name
      expect(page).to have_field 'member[first_name]', with: member.first_name
      expect(page).to have_field 'member[last_name_kana]', with: member.last_name_kana
      expect(page).to have_field 'member[first_name_kana]', with: member.first_name_kana
      expect(page).to have_field 'member[position]', with: member.position
      expect(page).to have_field 'member[height]', with: member.height
      expect(page).to have_field 'member[weight]', with: member.weight
      expect(page).to have_field 'member[original_team]', with: member.original_team
      expect(page).to have_field 'member[hobby]', with: member.hobby
      expect(page).to have_field 'member[goal]', with: member.goal
      # expect(page).to have_field 'member[image_id]', with: member.image_id
    end
    it "変更・ボタンが存在する" do
      expect(page).to have_button '変更を保存'
    end
    #入力後「変更を保存」をクリックすると正しく更新される
    context "スタッフ・選手編集成功のテスト"do
      before do
        visit edit_admins_member_path(member)
        @member_old_last_name = member.last_name
        fill_in 'member[last_name]', with: Faker::Lorem.characters(number:10)
        click_button '変更を保存'
      end
      it 'last_nameが正しく更新される' do
        expect(member.reload.last_name).not_to eq @member_old_last_name
      end
      it 'リダイレクト先が選手・スタッフ管理画面になっている' do
        expect(current_path).to eq admins_member_path(member)
      end
    end
  end


  context "選手・スタッフ削除テスト" do
    before do
      member = create(:member, last_name: 'test')
      visit admins_member_path(member)
      click_link '削除'
    end
    context "選手・スタッフ削除の成功" do
      it '正しく削除される' do
        expect(page).not_to eq have_content 'test'
      end
      it 'リダイレクト先が選手・スタッフ管理画面になっている' do
        expect(current_path).to eq admins_members_path
      end
    end
  end

end