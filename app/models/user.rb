class User < ApplicationRecord
  validates :email, presence: true, uniqueness: true
  validates :spotify_id, presence: true
  validates :token, presence: true
  validates :refresh_token, presence: true
  
  has_many :friendships
  has_many :friends, through: :friendships
  has_many :travel_buddies
  has_many :trips, through: :travel_buddies
end
