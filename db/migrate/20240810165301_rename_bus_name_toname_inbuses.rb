class RenameBusNameTonameInbuses < ActiveRecord::Migration[7.1]
  def change
    rename_column :buses, :Bus_name, :name
  end
end
