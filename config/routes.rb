Rails.application.routes.draw do


  root "static_pages#index"

  devise_for :users, path: "accounts"

  authenticate :user do
    resources :users, only: [:index, :show]
  end

  namespace :user, path: "player" do
    resources :user_profiles, path: "profile"
  end

  resources :tournaments do
    resources :tournament_registrations, path: "registration"

  end
end
