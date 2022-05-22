Rails.application.routes.draw do
  resources :products do
    # resources :comments, only: [:index, :new, :create]
    resources :comments, shallow: true, only: [:create, :destroy]

    member do
      post :like
      delete :unlike
      # /products/:id/buy
      get :buy
    end
  end

  # resources :comments, only: [:shoow, :edit, :update, :destroy]

  resource :users, only: [:create] do
    get "sign_up"
    get "login"
  end

  resource :sessions, only: [:create, :destroy]

  root "products#index"
end
