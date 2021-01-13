Rails.application.routes.draw do
  devise_for :users
  root to: "items#index"
  #root to: "items#new"
  #get 'items/new' to: "items#new"
  resources :users, only: [:index, :new, :create, :destroy]
  resources :items, only: [:index, :new, :create, ]
end
