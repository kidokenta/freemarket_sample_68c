Rails.application.routes.draw do
  get 'card/new'
  get 'card/show'
  get 'orders/show'
  get 'categories/index'
  devise_for :users
  root "items#index"
  resources :categories, only: :index
  resources :users, only: :show
  resources :adresses
  resources :items do
    patch  :buy,      on: :member
    get  :comfirm,      on: :member
  end
  resources :card, only: [:new, :show] do
    collection do
      post 'show', to: 'card#show'
      post 'pay', to: 'card#pay'
      post 'delete', to: 'card#delete'
    end
  end
end
