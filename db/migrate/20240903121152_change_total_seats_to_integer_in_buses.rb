class ChangeTotalSeatsToIntegerInBuses < ActiveRecord::Migration[7.1]
  def change
    change_column :buses, :total_seats, :integer
  end
end

