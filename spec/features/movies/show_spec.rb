require 'rails_helper'

describe Movie do
  describe 'As a visitor when I visit a movie show page' do
    it 'I see the movie and its attributes' do
      studio_1 = Studio.create!(name: 'Fabulous Studio', location: 'Colorado')

      movie_1 = studio_1.movies.create!(title: 'Hunger Games', creation_year: 2017, genre: 'Fiction')

      actor_1 = Actor.create!(name: 'Leonardo di Caprio', age: 45)
      actor_2 = Actor.create!(name: 'Tom Cruise', age: 55)
      actor_3 = Actor.create!(name: 'Brad Pitt', age: 50)

      ActorMovie.create!(actor_id: actor_1.id, movie_id: movie_1.id)
      ActorMovie.create!(actor_id: actor_2.id, movie_id: movie_1.id)
      ActorMovie.create!(actor_id: actor_3.id, movie_id: movie_1.id)

      visit movie_path(movie_1)

      expect(page).to have_content(movie_1.title)
      expect(page).to have_content(movie_1.creation_year)
      expect(page).to have_content(movie_1.genre)
    end
    it 'Shows all actors from youngest to oldest' do

      studio_1 = Studio.create!(name: 'Fabulous Studio', location: 'Colorado')

      movie_1 = studio_1.movies.create!(title: 'Hunger Games', creation_year: 2017, genre: 'Fiction')

      actor_1 = Actor.create!(name: 'Leonardo di Caprio', age: 45)
      actor_2 = Actor.create!(name: 'Tom Cruise', age: 55)
      actor_3 = Actor.create!(name: 'Brad Pitt', age: 50)

      ActorMovie.create!(actor_id: actor_1.id, movie_id: movie_1.id)
      ActorMovie.create!(actor_id: actor_2.id, movie_id: movie_1.id)
      ActorMovie.create!(actor_id: actor_3.id, movie_id: movie_1.id)

      visit movie_path(movie_1)

      expect(actor_1.name).to appear_before(actor_3.name)
      expect(actor_3.name).to appear_before(actor_2.name)
    end
    it 'Shows actors average age' do

      studio_1 = Studio.create!(name: 'Fabulous Studio', location: 'Colorado')

      movie_1 = studio_1.movies.create!(title: 'Hunger Games', creation_year: 2017, genre: 'Fiction')

      actor_1 = Actor.create!(name: 'Leonardo di Caprio', age: 45)
      actor_2 = Actor.create!(name: 'Tom Cruise', age: 55)
      actor_3 = Actor.create!(name: 'Brad Pitt', age: 50)

      ActorMovie.create!(actor_id: actor_1.id, movie_id: movie_1.id)
      ActorMovie.create!(actor_id: actor_2.id, movie_id: movie_1.id)
      ActorMovie.create!(actor_id: actor_3.id, movie_id: movie_1.id)

      visit movie_path(movie_1)

      expect(page).to have_content("Average Age: 50.0")
    end
  end
end
