require 'rails_helper'

RSpec.describe Activity do
  describe 'relationships' do
    it { should belong_to(:trip) }
  end

  describe 'validations' do
    it { should validate_presence_of(:name) }
  end
end
