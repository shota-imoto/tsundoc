Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'users/registrations' }
  root 'root#index'

  resources :tsundocs, only: [:new, :create]
  resources :books, only: [:new, :create]
  resources :movies, only: [:new, :create]
  resources :tags, only: [:new, :create]
end
