Rails.application.routes.draw do
  devise_for :users
  # devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root to: "items#index"
  resources :items do
    member do
      get :orders, to: 'orders#index'
    end
  end
end
