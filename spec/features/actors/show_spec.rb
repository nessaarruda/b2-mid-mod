require 'rails_helper'

describe Actor do
  describe 'As a visitor when I visit a actor show page' do
    it 'I see the actors attributes and unique list of all actors they worked with' do
      studio_1 = Studio.create!(name: 'Fabulous Studio', location: 'Colorado')

      movie_1 = studio_1.movies.create!(title: 'Hunger Games', creation_year: 2017, genre: 'Fiction')

      actor_1 = Actor.create!(name: 'Leonardo di Caprio', age: 45)
      actor_2 = Actor.create!(name: 'Tom Cruise', age: 55)
      actor_3 = Actor.create!(name: 'Brad Pitt', age: 50)

      ActorMovie.create!(actor_id: actor_1.id, movie_id: movie_1.id)
      ActorMovie.create!(actor_id: actor_2.id, movie_id: movie_1.id)

      visit actor_path(actor_1)

      expect(page).to have_content(actor_1.name)
      expect(page).to have_content(actor_1.age)
      expect(page).to have_content(actor_2.name)
      expect(page).to_not have_content(actor_3.name)
    end
  end
end
