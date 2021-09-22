require 'rails_helper'

RSpec.describe Trip do
  describe 'relationships' do
    # it { should belong_to(:user)}
    it { should have_many(:activities) }
    it { should have_many(:travel_buddies) }
    it { should have_many(:accommodations) }
    it { should have_many(:users).through(:travel_buddies) }
  end

  describe 'validations' do
    it { should validate_presence_of(:park_code) }
    it { should validate_presence_of(:park_name) }

    describe '#start_date_before_end_date' do
      it 'validates that start date is before end date' do
      user = create(:user)

      expect{Trip.create!(park_code: 'romo', park_name: 'RMNP', start_date: DateTime.new(2021, 11, 18), end_date: DateTime.new(2021, 10, 18), user: user)}.to raise_error(ActiveRecord::RecordInvalid)
      end
    end
  end

  describe 'class methods' do
    describe '::upcoming trips' do
      it 'it can show all trips that are upcoming and havent occured yet' do
        allow(Date).to receive(:today).and_return Date.new(2021, 9, 13)

        user = create(:user)
        trip1 = create(:trip, start_date: DateTime.new(2021, 11, 18), end_date: DateTime.new(2021, 11, 30), user: user)
        trip2 = create(:trip, start_date: DateTime.new(2021, 10, 18), end_date: DateTime.new(2021, 10, 30), user: user)
        trip3 = create(:trip, start_date: DateTime.new(2021, 8, 18), end_date: DateTime.new(2021, 8, 30), user: user)
        trip4 = create(:trip, start_date: nil, end_date: nil, user: user)

        expected = [trip2, trip1, trip4]

        expect(Trip.upcoming_trips).to eq(expected)
      end
    end

    describe '::current trips' do
      it 'shows trips that are currently in progress' do
        allow(Date).to receive(:today).and_return Date.new(2021, 9, 13)

        user = create(:user)
        trip1 = create(:trip, start_date: DateTime.new(2021, 9, 11), end_date: DateTime.new(2021, 9, 18), user: user)
        trip2 = create(:trip, start_date: DateTime.new(2021, 12, 18), end_date: DateTime.new(2021, 12, 30), user: user)
        trip3 = create(:trip, start_date: DateTime.new(2021, 11, 18), end_date: DateTime.new(2021, 12, 30), user: user)

        expected = [trip1]

        expect(Trip.current_trips).to eq(expected)
      end
    end

    describe '::past trips' do
      it 'shows trips that have already occured' do
        allow(Date).to receive(:today).and_return Date.new(2021, 9, 13)

        user = create(:user)
        trip1 = create(:trip, start_date: DateTime.new(2021, 7, 18), end_date: DateTime.new(2021, 7, 30), user: user)
        trip2 = create(:trip, start_date: DateTime.new(2021, 4, 18), end_date: DateTime.new(2021, 4, 30), user: user)
        trip3 = create(:trip, start_date: DateTime.new(2021, 11, 18), end_date: DateTime.new(2021, 12, 18), user: user)

        expected = [trip2, trip1]

        expect(Trip.past_trips).to eq(expected)
      end
    end
  end
end
