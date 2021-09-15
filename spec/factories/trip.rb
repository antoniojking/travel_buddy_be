FactoryBot.define do
  factory :trip do
    start_date { DateTime.new('11-18-2021') }
    end_date { DateTime.new('12-25-2021') }
    name { 'Teton National Park' }
    park_id { 'grte' }
  end
end
