class RenameclassTobusClassInbuses < ActiveRecord::Migration[7.1]
  def change
    rename_column :buses, :class, :bus_class 
  end
end
