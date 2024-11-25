class Waypoint < ApplicationRecord
  belongs_to :vehicle

  validates :latitude, :longitude, :timestamp, presence: true
end
