Rails.application.routes.draw do
  
  mount Ckeditor::Engine => '/ckeditor'
  get 'articles/index'
  root 'articles#index'
  resources :articles

  get '/createAdmin', to: 'admins#new'
  resources :admins

  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'

end
