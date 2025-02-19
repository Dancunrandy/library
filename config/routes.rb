Rails.application.routes.draw do
  get "sessions/new"
  get "sessions/create"
  get "sessions/destroy"
  root "books#index"
  resources :books, only: [:index, :show]
  resources :users, only: [:new, :show, :create]
  resources :borrowings, only: [:create, :destroy]
  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"
end