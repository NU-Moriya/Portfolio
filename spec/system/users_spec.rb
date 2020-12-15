require 'rails_helper'

RSpec.describe "Users", type: :system do
  let(:user){FactoryBot.create(:user)}
  let(:user2){FactoryBot.create(:user)}
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
    describe 'ユーザーログイン' do
      before do
        visit new_user_session_path
      end
      context 'ログイン画面に遷移' do
        it 'ログインに成功する' do
          fill_in 'user[email]', with: user.email
          fill_in 'user[password]', with: user.password
          click_button 'Log in'
          expect(page).to have_content 'ログインしました！'
        end

        it 'ログインに失敗する' do
          fill_in 'user[email]', with: ''
          fill_in 'user[password]', with: ''
          click_button 'Log in'
          expect(current_path).to eq(new_user_session_path)
        end
      end
    end
    describe 'ユーザーのテスト' do
      before do
        visit new_user_session_path
        fill_in 'user[email]', with: user.email
        fill_in 'user[password]', with: user.password
        click_button 'Log in'
      end
      describe 'マイページのテスト' do
        context '表示の確認' do
          it 'こだわりさん informationと表示される' do
            expect(page).to have_content 'こだわりさん information'
          end
          it '画像が表示される' do
            expect(page).to have_css('img.avatar')
          end
          it '名前が表示される' do
            expect(page).to have_content(user.name)
          end
          it 'アカウントネームが表示される' do
            expect(page).to have_content(user.account_name)
          end
          it '自己紹介が表示される' do
            expect(page).to have_content(user.introduction)
          end
          it '編集リンクが表示される' do
            visit user_path(user)
            expect(page).to have_link '', href: edit_user_path(user)
          end
          it 'DMリンクが表示される' do
            visit user_path(user)
            expect(page).to have_link '', href: connects_path(user)
          end
        end
      end
      describe '編集のテスト' do
        context '編集画面へ遷移' do
          it '遷移できる' do
            visit edit_user_path(user)
            expect(current_path).to eq edit_user_path(user)
          end
        end
        context '他人の編集画面への遷移' do
          it '遷移できない' do
            visit edit_user_path(user2)
            expect(current_path).to eq('/users/' + user.id.to_s)
          end
        end
        context 'プロフィールの編集' do
          it '編集に成功する' do
            visit edit_user_path(user)
            click_button 'Change !!'
            expect(page).to have_content '編集完了しました!'
            expect(current_path).to eq('/users/' + user.id.to_s)
          end
          it '編集に失敗する' do
            visit edit_user_path(user)
            fill_in 'user[name]', with: ''
            click_button 'Change !!'
            expect(page).to have_content 'error'
            expect(current_path).to eq('/users/' + user.id.to_s)
          end
        end
      end
    end
  end
end