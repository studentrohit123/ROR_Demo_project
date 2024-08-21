class AddDetailsToTickets < ActiveRecord::Migration[7.1]
  def change
    add_column :tickets, :seat_no, :string
    add_column :tickets, :name, :string
    add_column :tickets, :age, :integer
    add_column :tickets, :gender, :string
    add_reference :tickets, :booking, null: false, foreign_key: true
  end
end
