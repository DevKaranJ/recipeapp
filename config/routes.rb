Rails.application.routes.draw do
  resources :recipes, only: [:index, :show, :create]

end
