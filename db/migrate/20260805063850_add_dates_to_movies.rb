class AddDatesToMovies < ActiveRecord::Migration[8.1]
  def change
    add_column :movies, :start_date, :date
    add_column :movies, :end_date, :date
  end
end
