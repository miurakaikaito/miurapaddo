Rails.application.routes.draw do
  devise_for :users
  root to: 'posts#index'
  resources :posts do
  resources :comments, only: [:create]
  collection do
    get 'search'
  end
  end
  resources :recipes, only: [:new,:create]
  resources :menus, only: [:new]
  resources :images, only: [:index,]
  resources :users, only: [:show]
  end