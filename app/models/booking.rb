class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :bookable, polymorphic: true
  
  enum gender: { male: "Male", female: "Fermale" }
  enum seat_type: { AC: "AC", "Non&Ac": "Non&Ac",business: "Business", first_class: "first class"}

  #validates :name, :age, :gender, :date, :seat_type, presence: true

  validate :seat_must_be_available

  private

  def seat_must_be_available
    byebug
    if bookable_type == "Train" && bookable.bookings.where(seat_no: seat_no).exists?
      errors.add(:seat_no, "is already booked")
    end
  end
end

