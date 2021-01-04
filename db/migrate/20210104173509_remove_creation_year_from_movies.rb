class RemoveCreationYearFromMovies < ActiveRecord::Migration[5.2]
  def change
    remove_column :movies, :creation_year, :string
  end
end
