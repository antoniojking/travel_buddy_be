require 'rails_helper'

RSpec.describe User do
  describe 'relationships' do
    it { should have_many(:friendships) }
    it { should have_many(:invitations) }
    it { should have_many(:trips).through(:invitations) }
  end
end
