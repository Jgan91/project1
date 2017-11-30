Rails.application.routes.draw do
  root :to => 'pages#home'

  resources :languages
  resources :countries
  resources :writing_systems
  resources :language_families

  resources :users, :only => [:index, :new, :create, :edit, :update]
  get '/login' => 'session#new'
  get '/admin' => 'session#new'
  post '/login' => 'session#create'
  delete '/login' => 'session#destroy'
end
