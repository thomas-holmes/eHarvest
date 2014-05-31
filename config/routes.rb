EHarvest::Application.routes.draw do
  devise_for :users

  root 'home#index'

  get '/dashboard', controller: 'dashboard', action: 'index'

  get 'agency', to: 'agencies#show'

  resources :items
  resources :item_codes
  resources :agency_codes
  resources :locations
end
