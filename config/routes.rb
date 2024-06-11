Rails.application.routes.draw do
  root 'homes#top'
  devise_for :users
  resources :book, only: [:new, :create, :index, :show, :destroy] do
    resource :favorite, only: [:create, :destroy]
    resources :book_comments, only: [:create, :destroy]
  end
  resources :users, only: [:show, :edit, :update]
  get '/about', to: 'homes#about', as: 'about' 
  end