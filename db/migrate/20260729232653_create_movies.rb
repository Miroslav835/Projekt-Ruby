class CreateMovies < ActiveRecord::Migration[8.1]
  def change
    create_table :movies do |t|
      t.string :name
      t.string :genre
      t.integer :duration
      t.text :description

      t.timestamps
    end
  end
end
