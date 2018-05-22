Rails.application.routes.draw do

  resources :tournaments

  root "static_pages#index"

  devise_for :users, path: "accounts"

  authenticate :user do
    resources :users, only: [:show]
  end

  resources :registrations
end
