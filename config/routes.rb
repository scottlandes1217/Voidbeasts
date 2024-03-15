Rails.application.routes.draw do
  devise_for :users
  get 'menu/index'

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Use the authenticated :user block to define a root path for authenticated users
  authenticated :user do
    root 'menu#index', as: :authenticated_root
  end

  resources :saved_games, only: [:index, :new, :create, :show]

  # Defines the root path route ("/") for unauthenticated users
  # You can change "home#index" to wherever you want unauthenticated users to be directed.
  root "menu#index"
end
