Rails.application.routes.draw do
  resources :customers, :orders, :reviews, :books, :authors
  root "customers#index"
end
