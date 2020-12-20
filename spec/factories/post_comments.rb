FactoryBot.define do
  factory :post_comment do
    user_id {1}
    post_id {1}
    comment {"テストのコメントです"}
  end
end
