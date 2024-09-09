class Bus < ApplicationRecord
  belongs_to :route
  has_many :bookings, as: :bookable

  has_one_attached :image
  
  validates :name, :number, :total_seats, :bus_class, :price, presence: true
  validates :number, uniqueness: true
end
