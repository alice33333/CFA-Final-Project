
Rails.application.routes.draw do
  
  get 'sessions/new'

  get 'users/new'

  # rails generate controller StaticPages home help
  # created these two routes
  # Note: root and '#' makes the main page when logging on
  # Note: get and '/' makes additional pages
  
  root 'sessions#new'
  get 'front' => 'users#front'
  get 'back' => 'users#back'
  get 'all' => 'users#all'
  get 'manager' => 'users#manager'
  get 'create' => 'users#new'
  get 'average' => 'users#faverage'
  get 'score' => 'users#baverage'
  get 'reset' => 'users#reset'
  get 'finished' => 'users#finished'
  get 'before' => 'users#before'

  # for logging in
  get    'login'   => 'sessions#new'
  post   'login'   => 'sessions#create'
  delete 'logout'  => 'sessions#destroy'
  resources :users
end
