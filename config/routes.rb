Rails.application.routes.draw do

  resources :tournaments

  root 'static_pages#index'

  devise_for :users
  resources :users, :only => [:show]

  resources :registrations

end
