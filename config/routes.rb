Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  # root "pages#index"
  root "products#index"
  # get "products/new", to: "products#new", as: "new_product"
  # get "products", to: "products#index"
  # post "products", to: "products#create"
  # get "products/:id", to: "products#show", as: "product"
  # delete "products/:id", to: "products#destroy"
  # get "products/:id/edit", to: "products#edit", as: "edit_product"
  # patch "products/:id", to: "products#update"
  resources :products
  #resources :users #產生id, 適合後台
  resource :users, only: [:create] do #產生沒有id, 適合前台
    get "login"
    get "sign_up"
  end
  resource :sessions, only: [:create, :destroy]
  resources :votes
end
