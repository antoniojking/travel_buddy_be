class Trip < ApplicationRecord
  belongs_to :user
  has_many :activities
  has_many :travel_buddies
  has_many :users, through: :travel_buddies
end
