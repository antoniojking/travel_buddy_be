FactoryBot.define do
  
  factory :activity do
    name { Faker::Hobby.activity }
  end

end
