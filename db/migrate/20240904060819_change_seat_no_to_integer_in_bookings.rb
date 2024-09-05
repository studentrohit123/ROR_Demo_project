class ChangeSeatNoToIntegerInBookings < ActiveRecord::Migration[7.1]
  def change
    change_column :bookings, :seat_no, :integer
  end
end
