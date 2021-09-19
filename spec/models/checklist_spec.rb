require 'rails_helper'

RSpec.describe Checklist do
  describe 'relationships' do
    it { should belong_to(:trip) }
    it { should have_many(:checklist_items) }
  end

  describe 'validations' do
    it { should validate_presence_of(:category) }
  end
end
