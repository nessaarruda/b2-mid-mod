Rails.application.routes.draw do
  resources :studios do
    resources :movies
  end

  resources :movies, :actors
end
