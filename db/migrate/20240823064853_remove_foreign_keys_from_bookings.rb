class RemoveForeignKeysFromBookings < ActiveRecord::Migration[7.1]
  def change
    remove_foreign_key :bookings, :buses
    remove_foreign_key :bookings, :trains
  end
end
