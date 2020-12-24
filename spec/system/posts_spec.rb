require 'rails_helper'

RSpec.describe "Posts", type: :system do
  describe "こだわり投稿のテスト" do
    let!(:user){FactoryBot.create(:user)}
    let(:user2){FactoryBot.create(:user)}
    let!(:commitment){FactoryBot.create(:commitment)}
    let!(:post){FactoryBot.create(:post, user:user)}
    let(:post2){FactoryBot.create(:post, user:user2)}
    before do
    	visit new_user_session_path
    	fill_in 'user[email]', with: user.email
    	fill_in 'user[password]', with: user.password
    	click_button 'Log in'
    end
    describe "post 一覧画面テスト" do
      before do
        visit commitments_path
        visit commitment_path(commitment)
      end
      context "動作の確認" do
        it "こだわり投稿に成功する" do
          fill_in "post[content]", with: post.content
          find('.fa-paper-plane').click
          expect(page).to have_content post.content
        end
         it "空白ではこだわり投稿できない" do
          fill_in "post[content]", with: ""
          find('.fa-paper-plane').click
          expect(page).to_not have_content "こだわりをシェアしました"
        end
        it "post内キーワード検索結果が表示される" do
          fill_in "post[content]", with: post.content
          click_button "Go !!"
          expect(page).to have_content "Result Search for"
        end
      end
      context "画面遷移の確認" do
        it "ユーザー名をクリックするとプロフィール画面へ遷移する" do
          click_link post.user.name
          visit user_path(user)
          expect(page).to have_content "こだわりさん information"
        end
        it "ユーザー画像をクリックするとプロフィール画面へ遷移する" do
          click_link "#{post.user.name}さんのプロフィール画像"
          visit user_path(user)
          expect(page).to have_content "こだわりさん information"
        end
        it "post内容をクリックするとpost詳細画面へ遷移する" do
          click_link post.content
          visit post_path(post)
          expect(page).to have_content "Detail"
        end
        it "詳細を見る をクリックするとpost詳細画面へ遷移する" do
          click_link "View Detail"
          visit post_path(post)
          expect(page).to have_content "Detail"
        end
      end
    end
    describe "post 詳細画面のテスト" do
      let!(:post_comment){FactoryBot.create(:post_comment)}
      let!(:bravo){FactoryBot.create(:bravo)}
      before do
        visit commitments_path
        visit commitment_path(commitment)
        visit post_path(post)
      end
      context "表示の確認" do
        it "postしたユーザーネームが表示される" do
          expect(page).to have_content(post.user.name)
        end
        it "post内容が表示される" do
          expect(page).to have_content(post.content)
        end
        it "post投稿時の日時が表示される" do
          expect(page).to have_content(post.created_at.to_s(:datetime_jp))
        end
        it "post編集用アイコンが表示される" do
          find('.fa-eraser').click
        end
        it "post削除用アイコンが表示される" do
          find('.fa-trash').click
        end
        it 'postに対してのコメント数が表示される' do
  		    expect(page).to have_content(post.post_comments.count)
  		  end
  		  it 'postに対してのBravo数が表示される' do
  		    expect(page).to have_content(post.bravos.count)
  		  end
  		  it 'postに対してコメントしたユーザーネームが表示される' do
  		    expect(page).to have_content(post_comment.user.name)
  		  end
  		  it 'postに対してコメント内容が表示される' do
  		    expect(page).to have_content(post_comment.comment)
  		  end
  		  it 'postに対してコメントしたユーザーネームが表示される' do
  		    expect(page).to have_content(post_comment.created_at.to_s(:datetime_jp))
  		  end
  		  it 'コメント入力フォームが表示される' do
          expect(page).to have_field "post_comment[comment]"
        end
        it "コメント投稿用アイコンが表示される" do
          find('.fa-comment-dots').click
        end
      end
      describe "動作の確認" do
        context "編集のテスト" do
          it 'postの編集画面に遷移する' do
            visit edit_post_path(post)
            expect(current_path).to eq edit_post_path(post)
          end
          it 'postの編集画面が表示される' do
            visit edit_post_path(post)
            expect(page).to have_content "Edit..."
          end
          it '他人がシェアしたこだわり編集画面へ遷移できない' do
            visit edit_post_path(post2)
            expect(current_path).to eq('/users/' + user.id.to_s)
          end
          it 'postの編集に成功する' do
            visit edit_post_path(post)
            click_button 'Change !!'
            expect(page).to have_content 'シェアしたこだわりを変更しました！'
            expect(current_path).to eq('/posts/' + post.id.to_s)
          end
          it '編集に失敗する' do
            visit edit_post_path(post)
            fill_in 'post[content]', with: ''
            click_button 'Change !!'
            expect(current_path).to eq('/posts/' + user.id.to_s)
          end
        end
        context "削除のテスト" do
          it '削除できる' do
            find('.fa-trash').click
            expect(page).to have_content 'シェアしたこだわりを削除しました！'
            expect(current_path).to eq commitment_path(commitment)
          end
        end
      end
    end
  end
end