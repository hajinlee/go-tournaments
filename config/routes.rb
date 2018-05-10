Rails.application.routes.draw do
  devise_for :users
  resources :users, :only => [:show]
  
  resources :tournaments

  root 'static_pages#index'



end
