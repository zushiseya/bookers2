Rails.application.routes.draw do
  root 'homes#top'
  devise_for :users
  resources :books, only: [:new, :create, :index, :show, :edit, :update, :destroy]
  resources :users, only: [:index, :show, :edit, :update]
  get '/', to: 'homes#top', as: 'top_homes'
  get 'home/about', to: 'homes#about', as: 'about_homes'
  end