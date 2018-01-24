Rails.application.routes.draw do
  # get 'user/add'

  # get 'user/update'

  # get ':controller/:action'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # This creates routes for all basic CRUD oprations
  resources :home, only: :index
  resources :register, only: [ :index, :create ]
  # resources :login, only: :index

  resources :login do 
    get 'logout', on: :collection
  end
    # only: [ :index, :create ]

  resources :message, only: :create  
  resources :comment, only: :create
  resources :like, only: :create
 
  root controller: :login, action: :index

end
