class Route < ApplicationRecord 
  has_many :buses

  validates :source, :destination, :distance, presence: true
end
