require 'rails_helper'

describe 'タスク管理機能', type: :system do
  describe '一覧表示機能' do
    before do
      # ユーザーAを作成
      user_a = FactoryBot.create(:user, name: 'ユーザーA', email: 'a@example.com')
      # ユーザーAのタスクを作成
      FactoryBot.create(:task, name: '最初のタスク', user: user_a)
    end

    context 'ユーザーAがログインしているとき' do
      before do
        visit login_path
        fill_in 'メールアドレス',	with: 'a@example.com'
        fill_in 'パスワード', with: 'password'
        click_button 'ログインする'
      end

      it 'ユーザーAのタスクが一覧に表示される' do
        expect(page).to have_content '最初のタスク'
      end
    end

    context 'ユーザーBでログインしているとき' do
      before do
        FactoryBot.create(:user, name: 'ユーザーB', email: 'b@example.com')
        visit login_path
        fill_in 'メールアドレス',	with: 'b@example.com'
        fill_in 'パスワード', with: 'password'
        click_button 'ログインする'
      end

      it 'ユーザーAのタスクが表示されない' do
        # タスクの名称が画面上に表示されてないことを確認
        expect(page).to have_no_content '最初のタスク'
      end
    end
    
  end
end
