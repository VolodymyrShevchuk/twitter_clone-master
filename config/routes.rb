Rails.application.routes.draw do
  get 'tweets/new'

  get 'tweets/destroy'

  get 'tweets/show'

  get 'log_in' => 'sessions#new'
  delete 'log_out' => 'sessions#destroy'
  get 'sign_up' =>'users#new'

get 'show_followings' => 'users#followings'

resources :users do
  member do
    get 'following' => 'relationships#create'
    post 'unfollowing'=> 'relationships#destroy'
  end
end


  resources :sessions
  resources :home
  resources :tweets
  resources :relationships, only: [:create, :destroy]


  root 'home#index'

end
