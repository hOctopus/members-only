Rails.application.routes.draw do

  get     'login'   => 'sessions#new'
  post    'login'   => 'sessions#create'
  delete  'logout'  => 'sessions#destroy'

  resources :users
  resources :posts, only: [:new, :create, :index, :destroy]

  root 'posts#index'
end
