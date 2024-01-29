Rails.application.routes.draw do
  resources :users, only: [:index, :show] do
    resources :recipes, only: [:index, :new, :show, :create, :destroy]
  end
end
