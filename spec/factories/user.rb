FactoryBot.define do
  factory :user do
    authorization_token { 'alskjfhadlskjfh9823y489' }
    refresh_token { '2398rcbjwiuf834hf' }
    email { Faker::Internet.email }
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
  end
end
