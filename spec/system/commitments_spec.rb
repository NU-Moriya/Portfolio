require 'rails_helper'

RSpec.describe "Commitments", type: :system do
  describe "こだわりルームのテスト" do
    let(:user){FactoryBot.create(:user)}
    let!(:commitment){FactoryBot.create(:commitment)}
    before do
    	visit new_user_session_path
    	fill_in 'user[email]', with: user.email
    	fill_in 'user[password]', with: user.password
    	click_button 'Log in'
    end
    describe "一覧画面のテスト" do
      before do
        visit commitments_path
      end
      context "表示の確認" do
        it "Room's keywordと表示される" do
          expect(page).to have_content "Room's keyword"
        end
        it "検索フォームが表示される" do
          expect(page).to have_field "commitment[room_name]"
        end
        it "New Room's nameと表示される" do
          expect(page).to have_content "New Room's name"
        end
        it 'こだわり部屋検索ボタンが表示される' do
  		  	expect(page).to have_button "Go !!"
  		  end
        it "新規こだわりネームのフォームが表示される" do
          expect(page).to have_field "commitment[room_name]"
        end
        it 'createボタンが表示される' do
		  	  expect(page).to have_button "create !!"
		    end
		    it '作成済みのこだわり部屋ネームが表示される' do
		      expect(page).to have_content(commitment.room_name)
		    end
		    it 'こだわり部屋に入るボタンが表示される' do
  		  	expect(page).to have_link "Enter your .. !!", href: commitment_path(commitment)
  		  end
      end
      context "こだわり部屋作成の確認" do
        it "新規こだわり部屋作成に成功する" do
          fill_in "commitment[room_name]", with: commitment.room_name
          click_button "create !!"
          expect(page).to have_content "新しいこだわりルームができました!"
        end
        it "新規こだわり部屋作成後にこだわり部屋詳細画面へ遷移する" do
          fill_in "commitment[room_name]", with: commitment.room_name
          click_button "create !!"
          visit commitment_path(commitment)
          expect(current_path).to eq('/commitments/' + commitment.id.to_s)
        end
        it "新規こだわり部屋作成に失敗する" do
          fill_in "commitment[room_name]", with: ""
          click_button "create !!"
          expect(page).to have_content '入力項目を確認してください'
          expect(current_path).to eq('/commitments')
        end
      end
      context "こだわり部屋検索の確認" do
        it "こだわり部屋検索結果が表示される" do
          fill_in "commitment[room_name]", with: commitment.room_name
          click_button "Go !!"
          expect(page).to have_content "Result Search for"
        end
      end
      context "こだわり部屋動作の確認" do
        it "こだわり部屋詳細に遷移する" do
          click_link "Enter your .. !!"
          visit commitment_path(commitment)
          expect(page).to have_content "#{commitment.room_name} 's room"
        end
      end
    end
    describe "詳細画面のテスト" do
      let!(:post){FactoryBot.create(:post)}
      let!(:post_comment){FactoryBot.create(:post_comment)}
      let!(:bravo){FactoryBot.create(:bravo)}
      before do
        visit commitment_path(commitment)
      end
      context "表示の確認" do
        it "Keyword と表示される" do
          expect(page).to have_content "Keyword"
        end
        it "新規投稿用のShareとタイトルが表示される" do
          expect(page).to have_content "Share"
        end
        it "こだわりシェアの入力フォームが表示される" do
          expect(page).to have_field "post[content]"
        end
        it "シェアしたこだわりが表示される" do
          expect(page).to have_content(post.content)
        end
        it "こだわりをシェアしたユーザーの名前が表示される" do
          expect(page).to have_content(post.user.name)
        end
        it 'シェアしたこだわり詳細ボタンが表示される' do
  		  	expect(page).to have_link "View Detail", href: post_path(post)
  		  end
  		  it 'こだわりの内容が表示される' do
  		    expect(page).to have_content(post.content)
  		  end
  		  it 'postに対してのコメント数が表示される' do
  		    expect(page).to have_content(post.post_comments.count)
  		  end
  		  it 'postに対してのBravo数が表示される' do
  		    expect(page).to have_content(post.bravos.count)
  		  end
  		  it 'Bravoのランキングリンクボタンが表示される' do
  		    expect(page).to have_link "", href: posts_ranking_path(commitment_id: commitment.id)
  		  end
      end
    end
  end
end
