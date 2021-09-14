require 'rails_helper'

RSpec.describe User do
  describe 'relationships' do
    it { should have_many(:friendships) }
    it { should have_many(:friends).through(:friendships) }
    it { should have_many(:travel_buddies) }
    it { should have_many(:trips).through(:travel_buddies) }
  end
end
