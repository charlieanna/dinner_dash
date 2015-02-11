Rails.application.routes.draw do
  root to: "homes#index"

  resources :categories, only: [:show, :new, :create, :index]

  # these routes are for showing users a login form, logging them in, and logging them out.
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'

  get '/signup' => 'users#new'
  post '/users' => 'users#create'

  resources :line_items, only: [:create, :destroy, :edit, :update]
  resources :cart, only: [:show]
  resources :items, only: [:index, :edit, :new, :update, :create] do
    member do
      get :archive
    end
  end
  resources :orders, only: [:new, :create, :index, :show] do
    member do
      get :cancel

    end
    collection do
      get :filter
    end
  end
end
