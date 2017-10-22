Rails.application.routes.draw do
  get 'articles/index'

  resources :articles do
  	resources :comments
  end

  get '/createAdmin', to: 'admins#new'
  resources :admins

end
