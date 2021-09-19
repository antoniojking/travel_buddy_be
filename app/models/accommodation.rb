class Accommodation < ApplicationRecord
  belongs_to :trip

  validates :name, presence: true
  validates :location, presence: true
  validates :details, presence: true
end
