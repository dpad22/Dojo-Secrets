Rails.application.routes.draw do
  # -------------root--------------
  
  root 'sessions#new'

  # ------------likes-------------
  
  post 'likes/:id' => 'likes#create'

  delete 'likes/:id' => 'likes#destroy'

  # ------------secrets-------------

  get 'secrets' => 'secrets#index'

  post 'secrets/new' =>  'secrets#create'

  delete 'secrets/:id' => 'secrets#destroy'

  # -----------users--------------

  get 'users/new' => 'users#new'

  post 'users' => 'users#create'

  get 'users/:id' => 'users#show'

  get 'users/:id/edit' => 'users#edit'
  patch 'users/:id/edit' => 'users#update'

  delete 'users/:id' => 'users#destroy'

  # ------------sessions-------------

  get 'sessions/new' => 'sessions#new', as: 'login'

  post 'sessions' => 'sessions#create'

  get 'sessions/delete' => 'sessions#destroy', as: 'logout'

  
end
