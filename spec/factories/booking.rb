FactoryBot.define do
  factory :booking do
    name { "Mohit" }
    age { 30 }
    gender { "Male" }
    seat_no { 1 }
    date { Date.today }
    
    association :bookable, factory: :bus
    association :user 
  end
end