Rails.application.routes.draw do
  devise_for :users
  root to: 'gourmets#index'
  resources :gourmets, only: [:index, :new, :create, :show]
end
