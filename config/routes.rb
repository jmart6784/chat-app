Rails.application.routes.draw do
  devise_for :users
  root to: "users#index"
  resources :users, only: [:index, :show]

  resources :friend_requests, only: [:index, :update] do
    member do
      put :ajax_friend_request
    end
  end

  resources :friendships, only: [:update] do
    member do
      put :ajax_friendship
    end
  end
end
