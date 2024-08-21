class CreateBuses < ActiveRecord::Migration[7.1]
  def change
    create_table :buses do |t|
      t.string :Bus_name
      t.string :Bus_number
      t.string :Capacity
      t.string :Bus_type

      t.timestamps
    end
  end
end
