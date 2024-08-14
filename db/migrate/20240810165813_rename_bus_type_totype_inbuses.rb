class RenameBusTypeTotypeInbuses < ActiveRecord::Migration[7.1]
  def change
    rename_column :buses, :Bus_type, :type 
  end
end
