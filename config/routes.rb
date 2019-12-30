Rails.application.routes.draw do
  root "static_pages#home"
  resources :users
  resources :events, only: [:index, :show, :create, :new]
  get "signup", to: "users#new", as: "signup"
  get "users/show"
  get "login", to: "sessions#new", as: "login"
  post "login", to: "sessions#create"
  delete "logout", to: "sessions#destroy"
  post "add_invitees", to: "invitations#create", as: "add_invitees"
  post "accept_invitation", to: "invitations#accept_invitation", as: "accept_invitation"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
