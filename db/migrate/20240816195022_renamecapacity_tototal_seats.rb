class RenamecapacityTototalSeats < ActiveRecord::Migration[7.1]
  def change
    rename_column :buses, :capacity, :total_seats
  end
end
