Rails.application.routes.draw do
  resources :users, only: [:index, :show]
  resources :foods, only: [:index, :new, :create, :destroy] 
  resources :recipes, only: [:index, :new, :show, :create, :destroy]
end
