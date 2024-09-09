class RemoveSeatTypeFromBookings < ActiveRecord::Migration[7.1]
  def change
    remove_column :bookings, :seat_type, :string
  end
end
