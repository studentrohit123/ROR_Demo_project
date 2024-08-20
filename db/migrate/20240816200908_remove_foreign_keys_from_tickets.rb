class RemoveForeignKeysFromTickets < ActiveRecord::Migration[7.1]
  def change
    remove_foreign_key :tickets, :buses
    remove_foreign_key :tickets, :users
  end
end
