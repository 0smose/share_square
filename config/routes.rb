Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  # We define root to the homepage
  root to: 'static_pages#home'

  # Static pages
  get 'static_pages/about_us'

  # Routes for Devise
  devise_for :users

  # ------- Route declarations : ---------
  resources :home, only: [:index]
  resources :ads
  resources :admins, only: [:index, :edit, :update, :destroy]


   # Message system
  resources :personal_messages, only: [:new, :create]
  resources :conversations, only: [:index, :show]


  resources :users, only: [:show, :edit, :update, :destroy] do
    resources :avatars, only: [:create]
  end

   # Admin dashboard
  namespace :admins do
    root to: "admins#index"
    resources :users
    resources :ads, only: [:index, :edit, :update, :destroy]
  end

  # Serve websocket cable requests in-process
  mount ActionCable.server => '/cable'
end
