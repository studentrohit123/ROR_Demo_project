class RemoveForeignKeyFromTicketstable < ActiveRecord::Migration[7.1]
  def change
    remove_foreign_key :tickets, :bookings
  end
end
