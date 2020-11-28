Rails.application.routes.draw do
  devise_for :users
  root 'root#index'

  resources :tsundoc, only: [:new, :create]
end
