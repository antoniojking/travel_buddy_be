require 'rails_helper'

RSpec.describe 'accommodations api' do
  describe 'happy path' do
    it 'can create a new accommodation' do
      user = create(:user)
      trip = create(:trip, user: user)
      accommodation_params = {
        name: 'Camp 4',
        location: 'Yosemite Valley',
        details: 'Pitch your test behind the large boulder'
      }
      headers = {"CONTENT_TYPE" => "application/json"}

      post "/api/v1/trips/#{trip.id}/accommodations", headers: headers, params: JSON.generate(accommodation_params)

      expect(response).to be_successful

      accommodation = Accommodation.last

      expect(accommodation.name).to eq(accommodation_params[:name])
      expect(accommodation.location).to eq(accommodation_params[:location])
      expect(accommodation.details).to eq(accommodation_params[:details])
    end

    it 'can send a list of a trips accommodations' do
      user = create(:user)
      trip = create(:trip, user: user)
      accommodation1 = create(:accommodation, trip: trip)
      accommodation2 = create(:accommodation, trip: trip)

      get "/api/v1/trips/#{trip.id}/accommodations"

      expect(response).to be_successful

      accommodations = JSON.parse(response.body, symbolize_names: true)

      expect(accommodations).to have_key(:data)

      accommodations[:data].each do |accommodation|
        expect(accommodation).to have_key(:id)
        expect(accommodation).to have_key(:attributes)
        expect(accommodation[:attributes]).to have_key(:name)
        expect(accommodation[:attributes]).to have_key(:location)
        expect(accommodation[:attributes]).to have_key(:details)
      end
    end

    it 'can send one accommodation for a trip' do
      user = create(:user)
      trip = create(:trip, user: user)
      accommodation = create(:accommodation, trip: trip)

      get "/api/v1/trips/#{trip.id}/accommodations/#{accommodation.id}"

      expect(response).to be_successful

      accommodation = JSON.parse(response.body, symbolize_names: true)

      expect(accommodation).to have_key(:data)

      expect(accommodation[:data]).to have_key(:id)
      expect(accommodation[:data]).to have_key(:attributes)
      expect(accommodation[:data][:attributes]).to have_key(:name)
      expect(accommodation[:data][:attributes]).to have_key(:location)
      expect(accommodation[:data][:attributes]).to have_key(:details)
    end

    it 'can send update an existing accommodation for a trip' do
      user = create(:user)
      trip = create(:trip, user: user)
      accommodation = create(:accommodation, trip: trip)
      previous_name = accommodation.name
      accommodation_params = {
        name: 'Yosemit Lodge'
      }
      headers = {"CONTENT_TYPE" => "application/json"}

      patch "/api/v1/trips/#{trip.id}/accommodations/#{accommodation.id}", headers: headers, params: JSON.generate(accommodation_params)

      expect(response).to be_successful


      updated_accommodation = Accommodation.find(accommodation.id)
      expect(updated_accommodation.name).to_not eq(previous_name)

      accommodation = JSON.parse(response.body, symbolize_names: true)

      expect(accommodation).to have_key(:data)

      expect(accommodation[:data]).to have_key(:id)
      expect(accommodation[:data]).to have_key(:attributes)
      expect(accommodation[:data][:attributes]).to have_key(:name)
      expect(accommodation[:data][:attributes]).to have_key(:location)
      expect(accommodation[:data][:attributes]).to have_key(:details)
    end

    it 'can delete an existing accommodation for a trip' do
      user = create(:user)
      trip = create(:trip, user: user)
      accommodation = create(:accommodation, trip: trip)
      previous_name = accommodation.name

      delete "/api/v1/trips/#{trip.id}/accommodations/#{accommodation.id}"

      expect(response).to be_successful

      expect{Accommodation.find(accommodation.id)}.to raise_error(ActiveRecord::RecordNotFound)
    end
  end

  describe 'sad path' do
    it 'will not make a new accommodation if some params are missing' do
      user = create(:user)
      trip = create(:trip, user: user)
      accommodation_params = {
        name: 'Camp 4',
        location: 'Yosemite Valley'
      }
      headers = {"CONTENT_TYPE" => "application/json"}

      post "/api/v1/trips/#{trip.id}/accommodations", headers: headers, params: JSON.generate(accommodation_params)

      expect(response).to_not be_successful
      expect(response.status).to eq(400)

      error = JSON.parse(response.body, symbolize_names: true)

      expect(error).to have_key(:message)
    end

    it 'will not send a successful response if id does not match an existing accommosation' do
      user = create(:user)
      trip = create(:trip, user: user)
      accommodation = create(:accommodation, trip: trip)

      get "/api/v1/trips/#{trip.id}/accommodations/1234"

      expect(response).to_not be_successful
      expect(response.status).to eq(404)
    end

    it 'will not update an accommodation if id does not match an existing accommosation' do
      user = create(:user)
      trip = create(:trip, user: user)
      accommodation_params = {
        name: 'Yosemit Lodge'
      }
      headers = {"CONTENT_TYPE" => "application/json"}

      patch "/api/v1/trips/#{trip.id}/accommodations/1234", headers: headers, params: JSON.generate(accommodation_params)

      expect(response).to_not be_successful
      expect(response.status).to eq(404)
    end

    it 'will not delete an accommodation if id does not match an existing accommosation' do
      user = create(:user)
      trip = create(:trip, user: user)
      accommodation_params = {
        name: 'Yosemit Lodge'
      }
      headers = {"CONTENT_TYPE" => "application/json"}

      delete "/api/v1/trips/#{trip.id}/accommodations/1234"

      expect(response).to_not be_successful
      expect(response.status).to eq(404)
    end
  end
end
