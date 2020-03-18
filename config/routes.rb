Rails.application.routes.draw do
  get 'favorites/create'
  get 'favorites/destroy'
  root to: 'toppages#index'

  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'

  get 'signup', to: 'users#new'
  resources :users, only: [:index, :show, :new, :create] do
    member do
      get :followings
      get :followers
      get :favoritings
      get :favoriters
    end
    collection do
      get :search
    end
  end
  resources :users, only: [:index, :show, :new, :create]

  resources :microposts, only: [:create, :destroy] 
  resources :relationships, only: [:create, :destroy]
  resources :favorites, only: [:create, :destroy]
end


  