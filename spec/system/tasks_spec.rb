require 'rails_helper'

describe 'タスク管理機能', type: :system do
  describe '一覧表示機能' do
    before do
      user_a = FactoryBot.create(:user, name: 'ユーザーA', email: 'a@example.com')
      FactoryBot.create(:task, name: '最初のタスク', user: user_a)
    end

    context 'ユーザーAがログインしているとき' do
      before do
        # ユーザーAでログイン
        visit login_path
        fill_in 'メールアドレス',	with: 'a@example.com'
        fill_in 'パスワード', with: 'password'
        click_button 'ログインする'
      end

      it 'ユーザーAのタスクが一覧に表示される' do
        # 作成済みのタスクの名称が画面に表示されていることを確認
        expect(page).to have_content '最初のタスク'
      end
    end
  end
end
