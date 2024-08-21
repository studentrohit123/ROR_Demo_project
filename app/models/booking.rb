class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :bus

  validates :name, :age, :gender, :date, :seat_type, presence: true
end
