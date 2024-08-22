class Route < ApplicationRecord 
  has_many :buses, dependent: :destroy
  has_many :trains
  
  validates :source, :destination, :distance, presence: true
end
