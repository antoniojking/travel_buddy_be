require 'rails_helper'

 RSpec.describe 'trip API' do
  describe 'happy path' do
    it 'can create a new trip' do
      user = create(:user)
      trip_params = {
        start_date: DateTime.new(2021, 11, 18),
        end_date: DateTime.new(2021, 12, 18),
        park_code: 'grte',
        park_name: 'Rocky Mountain National Park',
        name: 'Graduation Teton Trip',
        user_id: user.id
      }
      headers = {"CONTENT_TYPE" => "application/json"}

      post '/api/v1/trips', headers: headers, params: JSON.generate(trip_params)

      expect(response).to be_successful

      trip = JSON.parse(response.body, symbolize_names: true)

      expect(trip).to have_key(:data)
      expect(trip[:data]).to have_key(:type)
      expect(trip[:data]).to have_key(:attributes)
      expect(trip[:data][:attributes]).to have_key(:name)
      expect(trip[:data][:attributes]).to have_key(:start_date)
      expect(trip[:data][:attributes]).to have_key(:end_date)
      expect(trip[:data][:attributes]).to have_key(:park_code)
    end

    it 'can send trip by trip id' do
      user = create(:user)
      trip = create(:trip, user: user)
      user2 = create(:user)
      travel_buddy1 = TravelBuddy.create!(user: user, trip: trip)
      travel_buddy1 = TravelBuddy.create!(user: user2, trip: trip)
      checklist = create(:checklist, trip: trip)
      checklist2 = create(:checklist, trip: trip)


      get "/api/v1/trips/#{trip.id}"

      expect(response).to be_successful

      trip = JSON.parse(response.body, symbolize_names: true)

      expect(trip).to have_key(:data)
      expect(trip[:data]).to have_key(:type)
      expect(trip[:data]).to have_key(:attributes)
      expect(trip[:data][:attributes]).to have_key(:name)
      expect(trip[:data][:attributes]).to have_key(:start_date)
      expect(trip[:data][:attributes]).to have_key(:end_date)
      expect(trip[:data][:attributes]).to have_key(:park_code)
      expect(trip[:data][:attributes]).to have_key(:park_name)
      expect(trip[:data][:attributes]).to have_key(:travel_buddies)
      expect(trip[:data][:attributes]).to have_key(:accommodations)
    end

    it 'can update an existing  trip' do
      user = create(:user)
      existing_trip = create(:trip, user: user)
      trip_params = {
        start_date: DateTime.new(2021, 11, 18),
        end_date: DateTime.new(2021, 12, 18),
        name: 'Graduation Teton Trip'
      }
      headers = {"CONTENT_TYPE" => "application/json"}

      patch "/api/v1/trips/#{existing_trip.id}", headers: headers, params: JSON.generate(trip_params)

      expect(response).to be_successful

      trip = JSON.parse(response.body, symbolize_names: true)


      expect(trip).to have_key(:data)
      expect(trip[:data]).to have_key(:type)
      expect(trip[:data]).to have_key(:attributes)
      expect(trip[:data][:attributes]).to have_key(:name)
      expect(trip[:data][:attributes]).to have_key(:start_date)
      expect(trip[:data][:attributes]).to have_key(:end_date)
      expect(trip[:data][:attributes]).to have_key(:park_code)

      updated_trip = Trip.find(existing_trip.id)

      expect(updated_trip.name).to eq(trip_params[:name])
      expect(updated_trip.start_date).to eq(trip_params[:start_date])
      expect(updated_trip.end_date).to eq(trip_params[:end_date])
    end
  end

  describe 'sad path' do
    it 'will return bad_request status if request lacks all params' do
      user = create(:user)
      trip_params = {
        start_date: DateTime.new(2021, 11, 18),
        end_date: DateTime.new(2021, 12, 18),
        name: 'Graduation Teton Trip',
        user_id: user.id
      }

      headers = {"CONTENT_TYPE" => "application/json"}

      post '/api/v1/trips', headers: headers, params: JSON.generate(trip_params)

      expect(response).to_not be_successful
      expect(response.status).to eq(400)

      error = JSON.parse(response.body, symbolize_names: true)

      expect(error).to have_key(:message)
    end

    it 'will raise an error if end date is before start date' do
      user = create(:user)
      trip = Trip.create!(park_name: 'RMNP', park_code: 'romo', start_date: nil, end_date: nil, user: user)
      trip_params = {
        start_date: DateTime.new(2021, 11, 18),
        end_date: DateTime.new(2021, 10, 18),
        name: 'Graduation Teton Trip'
      }

      headers = {"CONTENT_TYPE" => "application/json"}

      patch "/api/v1/trips/#{trip.id}", headers: headers, params: JSON.generate(trip_params)

      expect(response).to_not be_successful

      error = JSON.parse(response.body, symbolize_names: true)

      expect(error).to have_key(:message)
    end
  end
 end
