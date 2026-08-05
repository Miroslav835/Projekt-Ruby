class CreateScreenings < ActiveRecord::Migration[8.1]
  def change
    create_table :screenings do |t|
      t.references :movie, null: false, foreign_key: true
      t.datetime :starts_at

      t.timestamps
    end
  end
end
