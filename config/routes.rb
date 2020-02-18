Rails.application.routes.draw do
  get 'card/new'
  get 'card/show'
  get 'orders/show'
  devise_for :users
  root "items#index"
  resources :users, only: :show
<<<<<<< Updated upstream
  resources :items
=======
  resources :adresses
  resources :items  do
    resources :orders
  end
>>>>>>> Stashed changes
  resources :card, only: [:new, :show] do
    collection do
      post 'show', to: 'card#show'
      post 'pay', to: 'card#pay'
      post 'delete', to: 'card#delete'
    end
  end
end
