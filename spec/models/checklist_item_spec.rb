require 'rails_helper'

RSpec.describe ChecklistItem do
  describe 'relationships' do
    it { should belong_to(:checklist) }
    it { should belong_to(:user) }
  end

  describe 'validations' do
    it { should validate_presence_of(:name) }
  end
end
