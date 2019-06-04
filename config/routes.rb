Rails.application.routes.draw do
  get 'admins/index'
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # We define route to the homepage
  root to: 'home#index'

  # Route declarations :
  resources :home, only: [:index]
  resources :ads
  resources :users, only: [:show, :edit, :update, :destroy] do
    resources :avatars, only: [:create]
  end

  # Admin dashboard
  namespace :admins do
    root to: "admins#index"
    resources :users, only: [:index, :show, :edit, :update, :destroy, :create, :new]
    resources :ads, only: [:index, :show, :edit, :create, :update, :destroy, :new]
  end

end
