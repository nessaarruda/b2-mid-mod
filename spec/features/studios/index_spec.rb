require 'rails_helper'

describe Studio do
  describe 'As a visitor when I visit the index page' do
    it 'I see a list of all the movies for each studio' do

      studio_1 = Studio.create!(name: 'Fabulous Studio', location: 'Colorado')
      studio_2 = Studio.create!(name: 'Amazing Studio', location: 'California')
      studio_3 = Studio.create!(name: 'Beautiful Studio', location: 'New york')

      movie_1 = studio_1.movies.create!(title: 'Hunger Games', creation_year: 2017, genre: 'Fiction')
      movie_2 = studio_2.movies.create!(title: 'Hungover', creation_year: 2014, genre: 'Comedy')
      movie_3 = studio_3.movies.create!(title: 'The Story of Us', creation_year: 2000, genre: 'Drama')

      visit studios_path

      expect(page).to have_content(movie_1.title)
      expect(page).to have_content(movie_2.title)
      expect(page).to have_content(movie_3.title)
    end
  end
end
