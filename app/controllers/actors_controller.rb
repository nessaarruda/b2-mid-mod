class ActorsController < ApplicationController

  def show
    @actor = Actor.find(params[:id])
    @actors_worked_with = Actor.joins(:actor_movies).where(actor_movies: {actor_id: @actor.id}).distinct.pluck(:name)
  end
end
