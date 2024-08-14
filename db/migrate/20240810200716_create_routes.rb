class CreateRoutes < ActiveRecord::Migration[7.1]
  def change
    create_table :routes do |t|
      t.string :source
      t.string :destination
      t.string :distance

      t.timestamps
    end
  end
end
