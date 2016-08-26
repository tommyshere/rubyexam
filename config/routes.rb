Rails.application.routes.draw do

  delete 'joins/:id' => 'joins#destroy'

  post 'joins' => 'joins#create'

  get 'joins/create'

  get 'joins/destroy'

  delete 'events/:id' => 'events#destroy'

  get '/groups/:id' => 'events#show'

  post 'events' => 'events#create'

  get '/groups' => 'events#index'

  post 'session' => 'sessions#create'

  post 'users' => 'users#create'

  delete 'sessions' => 'sessions#destroy'

  root 'users#index'

end
