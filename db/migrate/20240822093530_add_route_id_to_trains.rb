class AddRouteIdToTrains < ActiveRecord::Migration[7.1]
  def change
    add_column :trains, :route_id, :integer
    add_index :trains, :route_id
    add_foreign_key :trains, :routes
  end
end
