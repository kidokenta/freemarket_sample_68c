Rails.application.routes.draw do
  devise_for :users,:controllers => {
    :registrations => 'users/registrations',
    :sessions => 'users/sessions',
    :passwords => 'users/passwords'
  }
  get 'images/create'
  root "items#index"
  get 'card/new'
  get 'card/show'
  get 'categories/index'
  resources :users, only: :show
  resources :adresses
  resources :items do
    resources :comments, only: :create
    collection do
      get 'get_size_children', defaults: { format: 'json' }
      get 'get_category_children', defaults: { format: 'json' }
      get 'get_category_grandchildren', defaults: { format: 'json' }
    end
    resources :images, only: :create
    patch  :buy,      on: :member
    get  :comfirm,      on: :member
    get  :transaction,      on: :member
    resource :likes, only:[:create,:destroy,:show]
    end
  
  resources :categories, only: [:index, :show, :new, :edit, :destroy]
  resources :adresses
  resources :card, only: [:new, :show] do
    collection do
      post 'show', to: 'card#show'
      post 'pay', to: 'card#pay'
      post 'delete', to: 'card#delete'
    end
  end
end