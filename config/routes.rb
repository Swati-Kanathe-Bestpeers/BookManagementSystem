Rails.application.routes.draw do
  get 'users/new'
  get 'users/create'
  resources :customers, :orders, :reviews, :books, :authors
  root "customers#index"
end
