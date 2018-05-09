Rails.application.routes.draw do
  get 'tournament/index'

  resources :tournament

  root 'tournament#index'

  get '/tournament/:id(.:format)' => 'tournament#show'

  get '/tournament/:id/edit(.:format)' => 'tournament#edit'
  put 'tournament/:id/edit(.:format)' => 'tournament#update'

  get '/new(.:format)' => 'tournament#new'
  post '/new(.:format)' => 'tournament#create'
  post 'tournament/new(.:format)' => 'tournament#create'

  delete '/tournament/:id(.:format)' => 'tournament#destroy'

  get '/list(.:format)' => 'tournament#list'

end
