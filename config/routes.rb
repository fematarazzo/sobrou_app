Rails.application.routes.draw do
  #get 'profiles/show'
  devise_for :users

  resources :restaurants do
    resources :dishes, only: [:new, :create]
    get "/dashboard", to: "restaurants#dashboard"
  end

  resources :dishes, only: [:index, :show, :edit, :update, :destroy] do
    resources :orders, only: [:create]
  end
  resources :profiles, only: [:show]


  root to: 'pages#home'

end
