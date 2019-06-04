Rails.application.routes.draw do
  get 'admins/index'
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # We define route to the homepage
  root to: 'home#index'

  # Route declarations :
  resources :home, only: [:index]

  resources :users, only: [:show, :edit, :update, :destroy] do
    resources :avatars, only: [:create]
  end

  # Admin dashboard
  namespace :admins do
    root to: "admins#index"
    resources :users
    resources :ads
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :ads

end
