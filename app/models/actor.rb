class Actor < ApplicationRecord
  has_many :actor_movies
  has_many :movies, through: :actor_movies

  def self.order_by_age
    order(age: :asc)
  end

  def self.average_age
    average(:age)
  end

  # def actors_worked_with
  #   require "pry"; binding.pry
  #   actor = Actor.find(params[:id])
  #
  # end
end
