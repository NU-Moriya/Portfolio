FactoryBot.define do
  factory :post do
    user_id {1}
    commitment_id {1}
    content {"テスト投稿"}
  end
end
