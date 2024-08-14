class RemoveForeignKeyFromTickets < ActiveRecord::Migration[7.1]
  def change
    remove_foreign_key :tickets, :routes
  end
end
