EHarvest::Application.routes.draw do
  devise_for :users
  root 'home#index'

  get '/dashboard', controller: 'dashboard', action: 'index'
end
