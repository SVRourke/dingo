Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "static#welcome"

  get 'login', to: 'auth#new'
  post 'login', to: 'auth#create'
  delete 'logout', to: 'auth#destroy'

  resource :users, only: [:new, :create, :destroy]
  resources :image
end
