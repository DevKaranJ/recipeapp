Rails.application.routes.draw do
  get 'ingredients/new'
  get 'ingredients/create'
  get 'ingredients/edit'
  get 'ingredients/update'
  get 'ingredients/destroy'

  devise_for :users
  resources :users, only: [:index, :show]
  resources :foods, only: [:index, :new, :create, :destroy]
  resources :recipes, only: [:index, :new, :show, :create, :destroy] do
    resources :ingredients, only: [:new, :create, :edit, :update, :destroy]
  end
  resources :public_recipes, only: [:index, :show, :destroy]
  resources :general_shopping_lists, only: [:index]

end
