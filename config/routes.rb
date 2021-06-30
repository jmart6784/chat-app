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
      delete :ajax_friendship_destroy
    end
  end
  get "friends/:id", to: "friendships#friends", as: :friends

  resources :chats do
    resources :messages, only: [:create, :destroy]
  end

  put "ajax_invite_create", to: "invites#ajax_invite_create", as: :ajax_invite_create
  get "invite/:id", to: "invites#invite", as: :invite
  get "invitations", to: "invites#invitations", as: :invitations

  resources :joined_chats, only: [:destroy]
  put "ajax_joined_chat_create", to: "joined_chats#ajax_joined_chat_create", as: :ajax_joined_chat_create
end
