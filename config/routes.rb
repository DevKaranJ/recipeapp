Rails.application.routes.draw do
  devise_for :users
  root "users#index"
  resources :users, only: [:index, :show] do
    resources :foods, only: [:index, :new, :create, :show, :destroy] 
    resources :recipes, only: [:index, :new, :show, :create, :destroy]
  end
end
