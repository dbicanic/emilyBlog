Rails.application.routes.draw do
  devise_for :admins, controllers: { registrations: "registrations"}
  get 'articles/index'

  resources :articles do
  	resources :comments
  end

  root 'articles#index'
end
