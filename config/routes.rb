Rails.application.routes.draw do
  get "/home/about" => "homes#about", as: "about"
  devise_for :users
  root 'homes#top'
  resources :books
  resources :users, only: [:index, :show, :new, :edit, :create, :update,]
end
