class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :bookable, polymorphic: true
  
  enum gender: { male: 0, female: 1 }
  enum seat_type: { AC: 0, "Non&AC": 1,business: 3, first_class: 4}

  validates :name, :age, :gender, :date, :seat_type, presence: true
end
