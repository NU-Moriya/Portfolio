require 'rails_helper'

RSpec.describe Post, type: :model do
  context "バリデーションのテスト" do
    before do
      @user = FactoryBot.create(:user)
      @commitment = FactoryBot.create(:commitment)
      @post = FactoryBot.create(:post)
    end

    it "postが正しく保存される" do

      expect(@post).to be_valid
    end

    it "postが正しく保存されない" do
      @post.content = ""
      @post.valid?
      expect(@post).not_to be_valid
    end
  end

  context "一致するデータが存在する場合の検索" do
    before do
      @user = FactoryBot.create(:user)
      @commitment = FactoryBot.create(:commitment)
      @post = FactoryBot.create(:post)
    end

    it "検索文字列に一致するpostを返す" do
      expect(Post.search_for("テスト", @commitment)).to include(@post)
      expect(Post.search_for("first", @commitment)).to_not include(@post)
    end

    it "検索文字列に一致するpostがない" do
      expect(Post.search_for("content", @commitment)).to be_empty
    end
  end
end
