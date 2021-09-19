class Checklist < ApplicationRecord
  validates :category, presence: true 

  belongs_to :trip
  has_many :checklist_items
end
