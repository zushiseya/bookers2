Rails.application.routes.draw do
  root 'homes#top'
  devise_for :user
  resources :books, only: [:new, :create, :index, :show, :edit, :destroy] do
    resource :favorite, only: [:create, :destroy]
    resources :book_comments, only: [:create, :destroy]
  end
  resources :user, only: [:show, :edit, :update]
  get '/top', to: 'homes#top', as: 'top_homes'
  get '/abou', to: 'homes#about', as: 'about_homes'
  end