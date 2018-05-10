Rails.application.routes.draw do
  devise_for :users
  resources :tournaments

  root 'static_pages#index'
end
