Rails.application.routes.draw do
  devise_for :users
  resources :users, only: [:show]
  
  resources :posts do
    resources :likes, only: [:create, :destroy]
    resources :comments, only: [:create]
  end
  root 'posts#index'
  

end
