Rails.application.routes.draw do

  get     'login'   => 'sessions#new'
  post    'login'   => 'sessions#create'
  delete  'logout'  => 'sessions#destroy'

  resources :users
  resources :posts, only: [:new, :create, :destroy, :index]

  root 'posts#index'
end
