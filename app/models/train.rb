class Train < ApplicationRecord
  belongs_to :route
  has_many :bookings, as: :bookable
  
end
