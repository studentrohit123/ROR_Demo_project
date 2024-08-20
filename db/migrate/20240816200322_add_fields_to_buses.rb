class AddFieldsToBuses < ActiveRecord::Migration[7.1]
  def change
    add_column :buses, :departure_time, :datetime
    add_column :buses, :arrival_time, :datetime
    add_column :buses, :price, :decimal
  end
end
