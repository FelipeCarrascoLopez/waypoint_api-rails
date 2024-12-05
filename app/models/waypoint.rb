class Waypoint < ApplicationRecord
  belongs_to :vehicle

  validates :latitude, :longitude, :timestamp, presence: true

  before_validation :set_default_timestamp, on: :create

  private

  def set_default_timestamp
    self.timestamp ||= Time.now.utc
  end
end
