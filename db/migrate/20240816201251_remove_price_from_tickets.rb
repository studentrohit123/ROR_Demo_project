class RemovePriceFromTickets < ActiveRecord::Migration[7.1]
  def change
    remove_column :tickets, :price, :integer
  end
end
