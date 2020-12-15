FactoryBot.define do
  factory :user do
    name {"name_1"}
    sequence(:account_name, "account_1")
    sequence(:email, "test@example.com")
    password {"testchan"}
  end
end
