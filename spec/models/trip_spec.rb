require 'rails_helper'

RSpec.describe Trip do
  describe 'relationships' do
    # it { should belong_to(:user)}
    it { should have_many(:activities) }
    it { should have_many(:travel_buddies) }
    it { should have_many(:users).through(:travel_buddies) }
  end
end
