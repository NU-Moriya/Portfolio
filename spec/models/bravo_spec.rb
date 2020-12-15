require 'rails_helper'

RSpec.describe Bravo, type: :model do
  
  context "バリデーションのテスト" do
    before do
      @user = FactoryBot.create(:user)
      @commitment = FactoryBot.create(:commitment)
      @post = FactoryBot.create(:post)
    end
    
    it "Bravoに対してpostとuserは一意であること" do
      other_bravo = @user.bravos.create(post_id: @post_id)
      expect(other_bravo).to_not be_valid 
    end
  end
end


