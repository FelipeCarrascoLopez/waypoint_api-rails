class Vehicle < ApplicationRecord
  has_many :waypoints, dependent: :destroy

  validates :identifier, presence: true, uniqueness: true
end
