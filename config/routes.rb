Rails.application.routes.draw do
  resources :users, only: [:index, :show] 
  resources :recipes, only: [:index, :new, :show, :create, :destroy]
end
