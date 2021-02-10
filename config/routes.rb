Rails.application.routes.draw do
  devise_for :users, controllers: {
    omniauth_callbacks: 'users/omniauth_callbacks',
    registrations: 'users/registrations'
  }
  root to: 'gourmets#index'
  resources :gourmets do
    resources :comments, only: :create
  end  
end
