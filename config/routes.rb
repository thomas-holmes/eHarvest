EHarvest::Application.routes.draw do
  devise_for :users

  root 'orders#index'

  get 'agency', to: 'agencies#show'

  resources :items
  resources :item_codes
  resources :agency_codes
  resources :locations

  resources :orders do
    resources :order_items do
    end
  end
end
