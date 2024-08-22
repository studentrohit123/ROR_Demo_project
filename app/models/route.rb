class Route < ApplicationRecord 
  has_many :buses, dependent: :destroy

  validates :source, :destination, :distance, presence: true
end
