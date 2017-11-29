Rails.application.routes.draw do
  get 'users/new'

  root :to => 'pages#home'

  resources :languages
  resources :countries
  resources :writing_systems
  resources :language_families

  resources :users
end
