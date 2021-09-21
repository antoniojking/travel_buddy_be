class Trip < ApplicationRecord
  validates :park_code, presence: true
  validates :park_name, presence: true


  has_many :activities
  has_many :travel_buddies
  has_many :users, through: :travel_buddies
  has_many :checklists
  has_many :accommodations
  belongs_to :user

  def self.upcoming_trips
    where("trips.start_date > '#{Date.today}' OR trips.start_date IS null").order(:start_date)
  end

  def self.current_trips
    where("'#{Date.today}' BETWEEN trips.start_date AND trips.end_date")
  end

  def self.past_trips
    where("trips.end_date < '#{Date.today}'").order(:start_date)
  end
end
