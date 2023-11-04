Rails.application.routes.draw do
  root "users#index"

  resources :posts do
    resources :comments
  end

  resources :users do
    resources :posts do
      resources :comments
    end
  end
end
