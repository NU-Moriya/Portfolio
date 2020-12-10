require 'rails_helper'

RSpec.describe "Users", type: :system do
  let(:user){FactoryBot.create(:user)}
  describe "ユーザー認証のテスト" do
    describe "ユーザー新規登録" do
      context '新規登録画面に遷移' do
        it '新規登録に成功する' do
          visit new_user_registration_path
          fill_in 'user[name]', with: 'テスト'
          fill_in 'user[account_name]', with: 'test'
          fill_in 'user[email]', with: 'test@example.com'
          fill_in 'user[password]', with: '000000'
          fill_in 'user[password_confirmation]', with: '000000'
          click_button 'Sign up'
          expect(page).to have_content 'アカウント登録が完了しました。'
        end

        it '新規登録に失敗する' do
          visit new_user_registration_path
          fill_in 'user[name]', with: ''
          fill_in 'user[account_name]', with: ''
          fill_in 'user[email]', with: ''
          fill_in 'user[password]', with: ''
          fill_in 'user[password_confirmation]', with: ''
          click_button 'Sign up'
          expect(page).to have_content 'ユーザー は保存されませんでした。'
        end
      end
    end
  end
end