require 'rails_helper'

describe Actor do
  describe 'relationships' do
    it { should have_many :actor_movies}
    it { should have_many(:movies).through(:actor_movies)}
  end
  describe 'class methods' do
    it 'display_name for actors youngest to oldest' do

      studio_1 = Studio.create!(name: 'Fabulous Studio', location: 'Colorado')

      movie_1 = studio_1.movies.create!(title: 'Hunger Games', creation_year: 2017, genre: 'Fiction')

      actor_1 = Actor.create!(name: 'Leonardo di Caprio', age: 45)
      actor_2 = Actor.create!(name: 'Tom Cruise', age: 55)
      actor_3 = Actor.create!(name: 'Brad Pitt', age: 50)

      ActorMovie.create!(actor_id: actor_1.id, movie_id: movie_1.id)
      ActorMovie.create!(actor_id: actor_2.id, movie_id: movie_1.id)
      ActorMovie.create!(actor_id: actor_3.id, movie_id: movie_1.id)

      expect(movie_1.actors.order_by_age).to eq([actor_1, actor_3, actor_2])
    end
    it 'average_age' do

      studio_1 = Studio.create!(name: 'Fabulous Studio', location: 'Colorado')

      movie_1 = studio_1.movies.create!(title: 'Hunger Games', creation_year: 2017, genre: 'Fiction')

      actor_1 = Actor.create!(name: 'Leonardo di Caprio', age: 45)
      actor_2 = Actor.create!(name: 'Tom Cruise', age: 55)
      actor_3 = Actor.create!(name: 'Brad Pitt', age: 50)

      ActorMovie.create!(actor_id: actor_1.id, movie_id: movie_1.id)
      ActorMovie.create!(actor_id: actor_2.id, movie_id: movie_1.id)
      ActorMovie.create!(actor_id: actor_3.id, movie_id: movie_1.id)

      expect(movie_1.actors.average_age).to eq(50.0)
    end
    # describe 'instance methods' do
    #   it 'actors_worked_with' do
    #   studio_1 = Studio.create!(name: 'Fabulous Studio', location: 'Colorado')
    #
    #   movie_1 = studio_1.movies.create!(title: 'Hunger Games', creation_year: 2017, genre: 'Fiction')
    #
    #   actor_1 = Actor.create!(name: 'Leonardo di Caprio', age: 45)
    #   actor_2 = Actor.create!(name: 'Tom Cruise', age: 55)
    #   actor_3 = Actor.create!(name: 'Brad Pitt', age: 50)
    #
    #   ActorMovie.create!(actor_id: actor_1.id, movie_id: movie_1.id)
    #   ActorMovie.create!(actor_id: actor_2.id, movie_id: movie_1.id)
    #
    #   expect(actor_1.actors_worked_with).to eq(actor_2.name)
    #   end
    # end
  end
end
