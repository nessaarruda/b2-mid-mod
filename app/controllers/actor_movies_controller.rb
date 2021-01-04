class ActorMoviesController < ApplicationController

  def show
    Movie.joins(:actor_movies).where(actor_movies: {actor_id: params[:actor_id], movie_id: params[:movie_id]})
    redirect_to movie_path(params[:movie_id])
  end
end
