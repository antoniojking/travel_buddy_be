FactoryBot.define do
  factory :checklist do
    category { Faker::Restaurant.name }
  end
end
