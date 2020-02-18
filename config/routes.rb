Rails.application.routes.draw do
  get 'card/new'
  get 'card/show'
  get 'orders/show'
  get 'categories/index'
  devise_for :users
  root "items#index"
  resources :users, only: :show
  resources :items
  resources :adresses
  resources :categories, only: [:index, :show, :new, :edit, :destroy] do
    #Ajaxで動くアクションのルートを作成
    collection do
      get 'get_category_children', defaults: { format: 'json' }
      get 'get_category_grandchildren', defaults: { format: 'json' }
    end
  resources :items  do
    resources :orders
  end
  resources :adresses
  resources :items do
    resources :orders
  end
  resources :card, only: [:new, :show] do
    collection do
      post 'show', to: 'card#show'
      post 'pay', to: 'card#pay'
      post 'delete', to: 'card#delete'
    end
  end
end
end