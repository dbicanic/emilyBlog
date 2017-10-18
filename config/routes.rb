Rails.application.routes.draw do
  get '/signup', to: 'admin#new'

  get 'welcome/index'

  resources :articles do
  	resources :comments
  end

  root 'welcome#index'
end
