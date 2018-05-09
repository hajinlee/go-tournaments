Rails.application.routes.draw do
  resources :tournaments

  root 'static_pages#index'
end
