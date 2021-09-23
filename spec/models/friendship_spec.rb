require 'rails_helper'

RSpec.describe Friendship do
  describe 'relationships' do
    it { should belong_to(:user) }
    it { should belong_to(:friend) }
  end

  describe 'validations' do
    describe '::already_friends' do
      it 'validates that a friendship is unique' do
        user1 = create(:user)
        user2 = create(:user)

        Friendship.create!(user_id: user1.id, friend_id: user2.id)

        expect{Friendship.create!(user_id: user1.id, friend_id: user2.id)}.to raise_error(ActiveRecord::RecordInvalid)
      end
    end
  end
end
