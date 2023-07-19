Rails.application.routes.draw do
  get 'homes/about'
  devise_for :users
  root 'homes#index'
  resources :books
  resources :users, only: [:index, :show, :new, :edit, :create, :update,]
end
