EHarvest::Application.routes.draw do
  devise_for :users
  root 'home#index'

  get '/dashboard', controller: 'dashboard', action: 'index'
  get '/agency_reports', controller: 'agency_reports', action: 'index'
end
