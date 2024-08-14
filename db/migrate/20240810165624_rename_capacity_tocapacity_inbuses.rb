class RenameCapacityTocapacityInbuses < ActiveRecord::Migration[7.1]
  def change
    rename_column :buses, :Capacity, :capacity
  end
end
