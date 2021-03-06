Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "static#welcome"

  get "login", to: "auth#new"
  post "login", to: "auth#create"
  delete "logout", to: "auth#destroy"

  resources :users, only: [:new, :create, :destroy] do
    get "images/bulk_delete", to: "image#bulk"
    post "images/bulk_delete", to: "image#bulk_destroy"
    delete "images/all", to: "image#delete_all"

    resources :image, only: [:new, :create, :show, :edit, :destroy, :index] do
      resources :tags, except: [:create, :new, :edit, :show, :update, :destroy, :index] do
        member do
          post "add", to: "tags#add"
          post "remove", to: "tags#remove"
        end
      end
    end
    resources :tags, only: [:index, :create, :show, :destroy]
  end
  match "*unmatched", to: "static#welcome", via: :all, constraints: lambda { |req|
                  req.path.exclude? "rails/active_storage"
                }
end
