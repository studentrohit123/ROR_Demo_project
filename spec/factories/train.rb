FactoryBot.define do
  factory :train do
    association :booking 
    caption { Faker::Lorem.sentence }
  end
end  