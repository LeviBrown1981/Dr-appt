Rails.application.routes.draw do
  root "doctors#index"
  devise_for :users

  resources :users
  resources :doctors do
    resources :appointments, only: [:index, :new, :create, :destroy]
  end
end