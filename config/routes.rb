Rails.application.routes.draw do
  get '/index' => 'tournament#index'
  
  resources :tournament_pages
  
  root 'tournament#index'
  get 'tournament/:id' => 'tournament#show'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
