class RenameBusNumberTonumberInbuses < ActiveRecord::Migration[7.1]
  def change
    rename_column :buses, :Bus_number, :number
  end
end
