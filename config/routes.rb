EHarvest::Application.routes.draw do
  devise_for :users

	root 'home#index'

  get '/agency_reports', controller: 'agency_reports', action: 'index'

  get 'agency', to: 'agencies#show'

  resources :items
  resources :item_codes
  resources :agency_codes
  resources :locations
  resources :searches

  resources :orders do
    resources :order_items do
    end
  end

end
