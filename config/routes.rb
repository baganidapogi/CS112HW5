Rails.application.routes.draw do
  root :to => "pages#index"

  resources :items
  resources :inventory_items
  resources :inventory_transactions
end
