Rails.application.routes.draw do
  get 'tournament/index'

  resources :tournaments

  root 'tournament#index'

  get '/tournament/:id(.:format)' => 'tournament#show'
  get '/tournament/:id(.:format)' => 'tournament#edit'
  patch '/tournament/:id(.:format)' => 'tournament#update'
  put '/tournament/:id(.:format)' => 'tournament#update'

  get '/new(.:format)' => 'tournament#new'
  post '/new(.:format)' => 'tournament#create'

  delete '/tournament/:id(.:format)' => 'tournament#destroy'
end
