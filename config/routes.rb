Rails.application.routes.draw do
  get 'orders/show'
  devise_for :users
  root "items#index"
  resources :users, only: :show
  resources :items
end
