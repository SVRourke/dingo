Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  get 'login', to: 'auth#new'
  post 'login', to: 'auth#create'
  delete 'logout', to: 'auth#destroy'

  resource :user do
    get 'images', to: "images#index"
  end
  resource :images, only: [:create, :show, :index, :update] 

end
