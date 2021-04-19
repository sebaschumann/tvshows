Rails.application.routes.draw do
  resources :episodes
  resources :seasons
  resources :novelas
  resources :genres
  root "genres#index"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
