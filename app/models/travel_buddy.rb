class TravelBuddy < ApplicationRecord
  validate :already_travel_buddies, on: :create

  belongs_to :trip
  belongs_to :user

  def already_travel_buddies
    travel_buddy = TravelBuddy.where(trip: self.trip_id, user_id: self.user_id)

    errors.add(:user_email, 'Travel Buddy already exists') if !travel_buddy.empty?
  end
end
