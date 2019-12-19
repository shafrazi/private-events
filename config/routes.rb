Rails.application.routes.draw do
  root "static_pages#home"
  resources :users
  get "signup", to: "users#new", as: "signup"
  get "users/show"
  get "login", to: "sessions#new", as: "login"
  post "login", to: "sessions#create"
  delete "logout", to: "sessions#destroy"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
