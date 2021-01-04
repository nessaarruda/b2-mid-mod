class AddCreationYearToMovies < ActiveRecord::Migration[5.2]
  def change
    add_column :movies, :creation_year, :integer
  end
end
