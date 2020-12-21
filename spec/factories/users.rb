FactoryBot.define do
  factory :user do
    name {"name_1"}
    avatar {"Rack::Test::UploadedFile.new(File.join(Rails.root, 'app/assets/images/no_image.png'))"}
    sequence(:account_name, "account_1")
    sequence(:email, "test@example.com")
    password {"testchan"}
  end
end
