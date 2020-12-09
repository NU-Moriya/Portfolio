require 'rails_helper'

RSpec.describe Commitment, type: :model do
  context "バリデーションのテスト" do
    before do
      @commitment = FactoryBot.create(:commitment)
    end

    it "commitmentが正しく保存される" do
      expect(@commitment).to be_valid
    end

    it "commitmentが正しく保存されない" do
      @commitment.room_name = ""
      @commitment.valid?
      expect(@commitment).not_to be_valid
    end
  end
  
  context "一致するデータが存在する場合の検索" do
    before do
      @commitment = FactoryBot.create(:commitment)
    end
    
    it "検索文字列に一致するroom_nameを返す" do
      expect(Commitment.search_for("テスト")).to include(@commitment)
      expect(Commitment.search_for("first")).to_not include(@commitment)
    end
    
    it "検索文字列に一致するroom_nameがない" do
      expect(Commitment.search_for("room_name")).to be_empty
    end
  end
end
