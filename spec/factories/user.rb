FactoryBot.define do
  factory :user do
    spotify_id { 'asljkbadskjfba' }
    token { 'alskjfhadlskjfh9823y489' }
    refresh_token { '2398rcbjwiuf834hf' }
    email { Faker::Internet.email }
  end
end
