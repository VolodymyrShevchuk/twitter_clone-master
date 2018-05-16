Rails.application.routes.draw do
  get 'log_in' => 'sessions#new'
  delete 'log_out' => 'sessions#destroy'
  get 'sign_up' =>'users#new'



  resources :users
  resources :sessions
  resources :home


  root 'home#index'

end
