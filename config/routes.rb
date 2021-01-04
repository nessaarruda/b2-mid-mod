Rails.application.routes.draw do
  resources :studios do
    resources :movies, only: [:index]
  end

  resources :movies, only: [:show]
  resources :actors, only: [:show]

  get '/actor_movies', to: 'actor_movies#show'
end
