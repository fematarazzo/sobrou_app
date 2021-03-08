Rails.application.routes.draw do
  #get 'profiles/show'
  devise_for :users

  resources :restaurants do
    resources :dishes, only: [:new, :create]
    resources :orders, only: [:index]
    get "/dashboard", to: "restaurants#dashboard"
    get "/index_today", to: "orders#index_today"
    get "/index_owner", to: "dishes#index_owner"
  end

  resources :dishes, only: [:index, :edit, :update, :destroy] do
    resources :orders, only: [:create, :index]


  end
  resources :profiles, only: [:show]
  resources :orders, only: [:show, :update]

  root to: 'pages#home'
end
