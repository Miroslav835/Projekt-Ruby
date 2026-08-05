class CreateScreenRooms < ActiveRecord::Migration[8.1]
  def change
    create_table :screen_rooms do |t|
      t.integer :room_number
      t.integer :number_of_seats

      t.timestamps
    end
  end
end
