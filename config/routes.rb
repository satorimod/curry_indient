Rails.application.routes.draw do
  devise_for :users, controllers: {
    omniauth_callbacks: 'users/omniauth_callbacks',
    registrations: 'users/registrations'
  }
  root to: 'gourmets#index'
  resources :gourmets do
    collection do
      get 'search'
      resources :comments, only: :create
    end  
  end  
end
