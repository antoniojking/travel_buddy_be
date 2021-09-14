require 'rails_helper'

RSpec.describe Trip do
  describe 'relationships' do
    it { should belong_to(:user)}
    it { should have_many(:activities) }
    it { should have_many(:invitations) }
    it { should have_many(:users).through(:invitations) }
  end
end
