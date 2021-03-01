Rails.application.routes.draw do
  devise_for :users

  resources :restaurants do
    resources :dishes, only: [:new, :create]
  end

  resources :dishes, only: [:index, :show, :edit, :update, :destroy] do
    resources :orders, only: [:create]
  end

  root to: 'pages#home'
end
