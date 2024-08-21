class Bus < ApplicationRecord
  belongs_to :route
  has_many :bookings

  validates :name, :number, :total_seats, :bus_class, :price, presence: true
  validates :number, uniqueness: true
end