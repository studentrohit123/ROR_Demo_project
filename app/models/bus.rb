class Bus < ApplicationRecord
   belongs_to :route
   has_many :tickets
   has_many :users, through: :tickets
end
