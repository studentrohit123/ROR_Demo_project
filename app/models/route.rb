class Route < ApplicationRecord 
  has_many :buses, dependent: :destroy
  has_many :trains
  
  validates :source, :destination, :distance, presence: true
  
  before_save :capitalize_source_and_destination

  def capitalize_source_and_destination
    self.source = source.capitalize if source.present?
    self.destination = destination.capitalize if destination.present?
  end

  def source_to_destination
    "#{source} --> #{destination}" 
  end
end
