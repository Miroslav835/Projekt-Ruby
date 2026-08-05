class CreateReservations < ActiveRecord::Migration[8.1]
  def change
    create_table :reservations do |t|
      t.references :screening, null: false, foreign_key: true
      t.string :email_address
      t.integer :number_of_seats

      t.timestamps
    end
  end
end
