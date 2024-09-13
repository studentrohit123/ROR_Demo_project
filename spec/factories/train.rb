FactoryBot.define do
  factory :train do
    association :route 
    caption { Faker::Lorem.sentence }
  end
end  