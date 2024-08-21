class AddDetailsToBookings < ActiveRecord::Migration[7.1]
  def change
    add_column :bookings, :seat_no, :string
    add_column :bookings, :name, :string
    add_column :bookings, :age, :integer
    add_column :bookings, :gender, :string
  end
end
