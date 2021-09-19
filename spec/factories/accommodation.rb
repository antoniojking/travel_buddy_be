FactoryBot.define do
  factory :accommodation do
    name { Faker::Nation.capital_city }
    location { Faker::Mountain.name  }
    details { Faker::ChuckNorris.fact  }
  end
end
