class RenameModeTypeToSeatType < ActiveRecord::Migration[7.1]
  def change
    rename_column :bookings, :mode_type, :seat_type
  end
end
