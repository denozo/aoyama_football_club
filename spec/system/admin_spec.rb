require 'rails_helper'

RSpec.describe "Admin", type: :system do
  before do
    @admin = FactoryBot.create(:admin)
  end
  it '保存されているユーザーの情報と合致すればログインできる' do
    # ログインする
    sign_in(@admin)
    # adminのトップ画面に遷移する
    visit admins_root_path
    # ログアウトが表示されていることを確認する
    expect(page).to hava_content('管理者ログアウト')
  end
end
