class User < ApplicationRecord
  validates :email, presence: true, uniqueness: true

  has_many :friendships, dependent: :destroy
  has_many :friends, through: :friendships, dependent: :destroy
  has_many :travel_buddies, dependent: :destroy
  has_many :trips, through: :travel_buddies, dependent: :destroy
end
