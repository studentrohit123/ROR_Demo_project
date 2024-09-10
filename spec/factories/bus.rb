
FactoryBot.define do
  factory :bus do
    name { 'Purohit' }
    number { '2021' }
    total_seats { '40'}
    bus_class { 'Non&Ac' }
    departure_time {'6:30 AM'}
    arrival_time { '10:30 AM'}
    price { '220' }
    route
  end
end
