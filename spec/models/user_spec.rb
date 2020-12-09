require 'rails_helper'

RSpec.describe User, type: :model do

  before do
    @user = FactoryBot.build(:user)
  end

  describe "バリデーションのテスト" do
    it "ユーザーネーム、アカウントネーム、メールアドレス、パスワードがあれば有効な状態であること" do
      expect(@user).to be_valid
    end

    it "ユーザーネーム入力されていないので保存されない" do
      @user.name = ""
      @user.valid?
      expect(@user.errors[:name]).to include("を入力してください")
    end

    it "ユーザーネームが20文字以内で保存される" do
      @user.name = "テ" * 20
      @user.valid?
      expect(@user).to be_valid
    end

    it "アカウントネームが入力されていないので保存されない" do
      @user.account_name = ""
      @user.valid?
      expect(@user.errors[:account_name]).to include("を入力してください")
    end

    it "すでに登録されているアカウントネームが入力された場合保存されない" do
      FactoryBot.create(:user)
      @user.valid?
      expect(@user.errors[:account_name]).to include("はすでに存在します")
    end

    it "アカウントネームが20文字以上の場合保存されない" do
      @user.account_name = "a" * 21
      @user.valid?
      expect(@user.errors[:account_name]).to include("は20文字以内で入力してください")
    end

    it "メールアドレスが入力されていないので保存されない" do
      @user.email = ""
      @user.valid?
      expect(@user.errors[:email]).to include("を入力してください")
    end

    it "すでに登録されているメールアドレスが入力された場合保存されない" do
      FactoryBot.create(:user)
      @user.valid?
      expect(@user.errors[:email]).to include("はすでに存在します")
    end


  end
end
