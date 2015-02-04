Rails.application.routes.draw do
  devise_for :users
  root :to => "pages#index", :via => [:get, :post]

  resources :items
  resources :inventory_items
  resources :inventory_transactions
end
