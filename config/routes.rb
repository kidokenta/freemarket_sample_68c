Rails.application.routes.draw do
  devise_for :users,:controllers => {
    omniauth_callbacks: 'users/omniauth_callbacks',
    :registrations => 'users/registrations',
    :sessions => 'users/sessions',
    :passwords => 'users/passwords'
  }
  get 'images/create'
  root "items#index"
  get 'card/new'
  get 'card/show'
  resources :users, only:[:show]
  resources :categories, only: [:index, :show, :new, :edit, :destroy]
  resources :adresses
  resources :items do
    resources :comments, only: [:new, :create]
    collection do
      get 'get_size_children', defaults: { format: 'json' }
      get 'get_category_children', defaults: { format: 'json' }
      get 'get_category_grandchildren', defaults: { format: 'json' }
      get 'search'
    end
    member do
      get 'get_size_children_edit', defaults: { format: 'json' }
      get 'get_category_children_edit', defaults: { format: 'json' }
      get 'get_category_grandchildren_edit', defaults: { format: 'json' }
    end
    resources :images, only: :create
    patch  :buy,      on: :member
    get  :comfirm,      on: :member
    get  :transaction,      on: :member
    resource :likes, only:[:create,:destroy,:show]
    end
  
  resources :adresses
  resources :card, only: [:new, :show] do
    collection do
      post 'show', to: 'card#show'
      post 'pay', to: 'card#pay'
      post 'delete', to: 'card#delete'
    end
  end
  namespace :api do
    resources "destroy", controller: :items, only: :image_destroy, defaults: { format: 'json' } do
      collection do
        delete "image_destroy"
      end
    end
  end

end