class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :bookable, polymorphic: true
  
  validates :name, :age, :gender,:seat_no, :date, presence: true

  enum gender: { male: "Male", female: "Female" }
end
