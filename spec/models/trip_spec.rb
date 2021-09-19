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
    it { should validate_presence_of(:start_date) }
    it { should validate_presence_of(:end_date) }
    it { should validate_presence_of(:park_code) }
    it { should validate_presence_of(:name) }
  end
end
