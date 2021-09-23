require 'rails_helper'

RSpec.describe TravelBuddy do
  describe 'relationships' do
    it { should belong_to(:trip) }
    it { should belong_to(:user) }
  end

  describe 'validations' do
    describe '::already_travel_buddies' do
      it 'validates that a travel buddy can only be added once' do
        user1 = create(:user)
        user2 = create(:user)
        trip = create(:trip, user: user1)

        TravelBuddy.create!(trip_id: trip.id, user_id: user2.id)

        expect{TravelBuddy.create!(trip_id: trip.id, user_id: user2.id)}.to raise_error(ActiveRecord::RecordInvalid)
      end
    end
  end
end
