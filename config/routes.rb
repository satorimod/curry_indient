Rails.application.routes.draw do
  devise_for :users
  root to: 'gourmets#index'
  resources :gourmets do
    resources :comments, only: :create
  end  
  get 'gourmets/search'
end
