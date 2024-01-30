Rails.application.routes.draw do

  get "up" => "rails/health#show", as: :rails_health_check # health check
  
  # root "posts#index"
  root to: "users#index"
  devise_for :users
  resources :users, only: [:index, :show]
  resources :foods, only: [:index, :new, :create, :destroy]
  resources :recipes, only: [:index, :new, :show, :create, :destroy]
  resources :public_recipes, only: [:index, :show, :destroy]

end
