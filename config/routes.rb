Rails.application.routes.draw do
  root to: "homes#index"

  resources :categories, only: [:show]
end
