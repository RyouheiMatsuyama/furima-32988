Rails.application.routes.draw do
  devise_for :users
  root to: "items#index"
  resources :users, only: [:index, :new, :create, :destroy]
  resources :items, only: [:index, :new, :create, ]
end
