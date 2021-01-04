class CreateMovies < ActiveRecord::Migration[5.2]
  def change
    create_table :movies do |t|
      t.string :title
      t.datetime :creation_year
      t.string :genre
    end
  end
end
