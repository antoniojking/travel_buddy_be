require 'rails_helper'

 RSpec.describe Weather do
   it 'exists and has attributes' do
     attributes = {
       current_temp: 89.8,
       current_conditions: 'Sunny',
       forecast: [{date: '2021-09-17', min_temp: 50, max_temp: 90, condition: 'Partly cloudy'}, {date: '2021-09-18', min_temp: 49, max_temp: 88, condition: 'Partly sunny'}]
     }

     weather = Weather.new(attributes)

     expect(weather).to be_an_instance_of(Weather)
     expect(weather.current_temp).to eq(attributes[:current_temp])
     expect(weather.current_conditions).to eq(attributes[:current_conditions])
     expect(weather.forecast).to eq(attributes[:forecast])
   end
 end
