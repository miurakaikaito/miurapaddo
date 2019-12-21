Rails.application.routes.draw do
  devise_for :users
  root to: 'posts#index'
  resources :posts do
  resources :comments, only: [:create]
  resources :likes, only: [:create, :destroy]
  collection do
    get 'search'
    get 'zairyou'
    get 'recipe'
    get 'impressions'
    get 'done'
  end
  end
  resources :users, only: [:show,:index]
  end