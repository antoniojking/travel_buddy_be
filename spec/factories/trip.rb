FactoryBot.define do
  factory :trip do
    start_date { Faker::Date.between(from: '2021-11-18', to: '2021-11-20') }
    end_date { Faker::Date.between(from: '2021-11-21', to: '2021-11-25') }
    name { 'Teton National Park' }
    park_code { 'grte' }
    park_name { Faker::Mountain.range }
  end
end
