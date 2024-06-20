Rails.application.routes.draw do
  root 'homes#top'
  devise_for :user
  resources :books, only: [:new, :create, :index, :show, :edit, :update, :destroy]
  resources :user, only: [:index, :show, :edit, :update]
  get '/top', to: 'homes#top', as: 'top_homes'
  get '/about', to: 'homes#about', as: 'about_homes'
  end