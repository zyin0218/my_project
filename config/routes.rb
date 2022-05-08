Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  # root "pages#index"
  root "votes#index"
  get "products/new", to: "products#new", as: "new_product"
  get "products", to: "products#index"
  post "products", to: "products#create"
  get "products/:id", to: "products#show", as: "product"
  delete "products/:id", to: "products#destroy"

  resources :votes
end
