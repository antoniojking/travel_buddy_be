class User < ApplicationRecord
  validates :email, presence: true, uniqueness: true

  has_many :friendships
  has_many :friends, through: :friendships
  has_many :travel_buddies
  has_many :trips, through: :travel_buddies
end
