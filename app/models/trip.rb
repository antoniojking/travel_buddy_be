class Trip < ApplicationRecord
  validates :start_date, presence: true
  validates :end_date, presence: true
  validates :park_code, presence: true
  validates :name, presence: true
  
  has_many :activities
  has_many :travel_buddies
  has_many :users, through: :travel_buddies
  has_many :checklists
end
