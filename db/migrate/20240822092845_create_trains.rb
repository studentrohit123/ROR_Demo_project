class CreateTrains < ActiveRecord::Migration[7.1]
  def change
    create_table :trains do |t|
      t.string :name
      t.string :number
      t.integer :total_seats
      t.string :train_class
      t.time :departure_time
      t.time :arrival_time
      t.decimal :price

      t.timestamps
    end
  end
end
