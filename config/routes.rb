Rails.application.routes.draw do
  root "books#index"
  resources :books, only: [:index, :show]
  resources :users, only: [:show]
  resources :borrowings, only: [:create, :destroy]
  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  delete "/logout", to: "sessions#destroy"
end