class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :bookable, polymorphic: true
  
  enum gender: { male: "Male", female: "Fermale" }
  
  validates :name, :age, :gender, :date, presence: true

  validate :seat_must_be_available

  private

  def seat_must_be_available
    if bookable.bookings.where(seat_no: seat_no).exists?
      errors.add(:seat_no, "is already booked")
    end
  end
end
