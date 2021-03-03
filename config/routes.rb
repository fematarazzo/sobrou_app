Rails.application.routes.draw do
  #get 'profiles/show'
  devise_for :users

  resources :restaurants do
    resources :dishes, only: [:new, :create]
  end

  resources :dishes, only: [:index, :show, :edit, :update, :destroy] do
    resources :orders, only: [:create, :index]
  end
  resources :profiles, only: [:show]
  resources :dashboard, only: [:show]

  root to: 'pages#home'


end
