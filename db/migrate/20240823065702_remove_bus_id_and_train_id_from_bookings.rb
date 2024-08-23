class RemoveBusIdAndTrainIdFromBookings < ActiveRecord::Migration[7.1]
  def change
    remove_column :bookings, :bus_id, :integer
    remove_column :bookings, :train_id, :integer
    
    # Remove indexes if they exist
    remove_index :bookings, name: "index_bookings_on_bus_id" if index_exists?(:bookings, :bus_id)
    remove_index :bookings, name: "index_bookings_on_train_id" if index_exists?(:bookings, :train_id)
  end
end
