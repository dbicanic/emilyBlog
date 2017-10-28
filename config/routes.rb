Rails.application.routes.draw do
  get 'articles/index'
  root 'articles#index'

  resources :articles do
  	resources :comments
  end

  get '/createAdmin', to: 'admins#new'
  resources :admins

  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'

end
