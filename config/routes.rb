Rails.application.routes.draw do

  resources :tournaments, :tournament_registrations

  root "static_pages#index"

  devise_for :users, path: "accounts"

  authenticate :user do
    resources :users, only: [:show]
  end

  namespace :user, path: "player" do
    resources :user_profiles, path: "profile"

  end
end
