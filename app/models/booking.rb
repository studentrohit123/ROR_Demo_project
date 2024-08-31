class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :bookable, polymorphic: true
  
  enum gender: { male: "Male", female: "Fermale" }
  enum seat_type: { AC: "AC", "Non&Ac": "Non&Ac",business: "Business", first_class: "first class"}

  validates :name, :age, :gender, :date, :seat_type, presence: true

end
