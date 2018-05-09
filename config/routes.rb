Rails.application.routes.draw do
  resources :tournaments

  root 'tournaments#index'
end
