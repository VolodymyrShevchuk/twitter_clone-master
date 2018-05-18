Rails.application.routes.draw do
  get 'tweets/new'

  get 'tweets/destroy'

  get 'tweets/show'

  get 'log_in' => 'sessions#new'
  delete 'log_out' => 'sessions#destroy'
  get 'sign_up' =>'users#new'



  resources :users
  resources :sessions
  resources :home
  resources :tweets


  root 'home#index'

end
