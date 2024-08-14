class AddRouteRefToBuses < ActiveRecord::Migration[7.1]
  def change
    add_reference :buses, :route, foreign_key: true
  end
end
