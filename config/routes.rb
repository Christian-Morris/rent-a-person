Rails.application.routes.draw do
  get "/", to: "pages#home"
  post "/", to: "users#index"
  devise_for :users
  # root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :users
end
