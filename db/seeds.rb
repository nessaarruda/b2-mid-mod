ActorMovie.destroy_all
Movie.destroy_all
Actor.destroy_all
Studio.destroy_all

studio_1 = Studio.create!(name: 'Fabulous Studio', location: 'Colorado')
studio_2 = Studio.create!(name: 'Amazing Studio', location: 'California')
studio_3 = Studio.create!(name: 'Beautiful Studio', location: 'New york')

movie_1 = studio_1.movies.create!(title: 'Hunger Games', creation_year: 2017, genre: 'Fiction')
movie_2 = studio_1.movies.create!(title: 'Hungover', creation_year: 2014, genre: 'Comedy')
movie_3 = studio_1.movies.create!(title: 'The Story of Us', creation_year: 2000, genre: 'Drama')

actor_1 = Actor.create!(name: 'Leonardo di Caprio', age: 45)
actor_2 = Actor.create!(name: 'Tom Cruise', age: 55)
actor_3 = Actor.create!(name: 'Brad Pitt', age: 50)

ActorMovie.create!(actor_id: actor_1.id, movie_id: movie_1.id)
ActorMovie.create!(actor_id: actor_1.id, movie_id: movie_2.id)
ActorMovie.create!(actor_id: actor_1.id, movie_id: movie_3.id)
ActorMovie.create!(actor_id: actor_2.id, movie_id: movie_1.id)
ActorMovie.create!(actor_id: actor_3.id, movie_id: movie_1.id)
