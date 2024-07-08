Rails.application.routes.draw do
  resources :customers, :orders, :reviews, :books, :authors
  resources :users, only: [:new, :create, :index, :show]
  resources :sessions, only: [:new, :create, :destroy]
  root "users#new"
end
  