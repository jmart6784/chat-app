Rails.application.routes.draw do
  devise_for :users
  root to: "static#index"
  resources :users, only: [:index, :show]
end
