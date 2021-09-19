require 'rails_helper'

 RSpec.describe Accommodation do
   describe 'relationships' do
     it { should belong_to(:trip) }
   end

   describe 'validations' do
     it { should validate_presence_of(:name) }
     it { should validate_presence_of(:location) }
     it { should validate_presence_of(:details) }
   end
 end
