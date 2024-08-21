class DropTicketsTable < ActiveRecord::Migration[7.1]
  def change
    drop_table :tickets
  end
end
