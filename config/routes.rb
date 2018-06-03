Rails.application.routes.draw do
  get 'log_in' => 'sessions#new'
  delete 'log_out' => 'sessions#destroy'
  get 'sign_up' =>'users#new'

  resources :users do
    member do
      get :followings
      get :followers
      get :my_tweets
    end
    resources :relationships, only: [:create, :destroy]
  end

  resources :tweets do

    resources :likes, only: [:create, :destroy]
  end

  resources :sessions
  resources :home


  resources :search, only: [:index, :create]

  root 'home#index'
end
