Rails.application.routes.draw do
  root :to => 'pages#home'

  resources :languages
  resources :countries
  resources :writing_systems
  resources :language_families
end
