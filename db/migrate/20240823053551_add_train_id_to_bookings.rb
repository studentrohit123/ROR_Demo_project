class AddTrainIdToBookings < ActiveRecord::Migration[7.1]
  def change
    add_column :bookings, :train_id, :integer
    add_foreign_key :bookings, :trains, column: :train_id
    add_index :bookings, :train_id
  end
end
