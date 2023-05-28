Rails.application.routes.draw do
  root 'homepage#index'
  get '/feeds' => 'feeds#index'

  # USERS
  #resources :users
  post 'users' => 'users#create'
  get 'users/:username/tweets' => 'users#count'
  # SESSIONS
  #resources :sessions
  post 'sessions' => 'sessions#create'
  get 'authenticated' => 'sessions#authenticated'
  delete 'sessions' => 'sessions#destroy'

  # TWEETS
  get 'tweets' => 'tweets#index'
  post 'tweets' => 'tweets#create'
  delete 'tweets/:id' => 'tweets#destroy'

  # Redirect all other paths to index page, which will be taken over by AngularJS
  get '*path' => 'homepage#index'
end
