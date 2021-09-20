class Trip < ApplicationRecord
  validates :park_code, presence: true
  validates :park_name, presence: true

  has_many :activities
  has_many :travel_buddies
  has_many :users, through: :travel_buddies
  has_many :checklists
  has_many :accommodations
  belongs_to :user
end
