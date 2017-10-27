Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/artists', to: 'artists#index'
  get '/artists/new', to: 'artists#new'
  post '/artists', to: 'artists#create'
  get '/artists/:id', to: 'artists#show', as: 'artist'
  get '/artists/:id/edit', to: 'artists#edit'
  put '/artists/:id', to: 'artists#update'
  patch '/artists/:id', to: 'artists#update'
  delete '/artists/:id', to: 'artists#destroy'
end
