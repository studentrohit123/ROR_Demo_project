class RenametypeToclassInbuses < ActiveRecord::Migration[7.1]
  def change
    rename_column :buses, :type, :class 
  end
end
