Rails.application.routes.draw do
  devise_for :users
  # resources :users, except: [:index]
  resources :restaurants do
    resources :dishes, only: [:new, :create]
  end

  resources :dishes, only: [:index, :show, :edit, :update, :destroy]


  root to: 'pages#home'
end
