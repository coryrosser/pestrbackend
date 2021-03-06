Rails.application.routes.draw do
  resources :updates
  resources :issues
  resources :groupmembers
  resources :groups
  resources :users

  post '/login', to: 'sessions#create'
  post '/signup', to: 'users#create'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
