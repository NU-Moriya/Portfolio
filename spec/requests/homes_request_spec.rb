require 'rails_helper'

RSpec.describe "Homes", type: :request do
  context "topページが正しく表示される" do
    before do
        get root_path
    end
    
    it "topページが表示される" do
      expect(response).to be_success
    end
    
    it "レスポンスが200を返すこと" do
      expect(response.status).to eq 200
    end
  end
end
