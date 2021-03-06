class Friendship < ApplicationRecord
  validate :already_friends, on: :create

  belongs_to :user
  belongs_to :friend, foreign_key: :friend_id, class_name: 'User'

  def already_friends
    friendships = Friendship.where(user_id: self.user_id, friend_id: self.friend_id)

    errors.add(:friend_email, 'Friendship already exists') if !friendships.empty?
  end
end
