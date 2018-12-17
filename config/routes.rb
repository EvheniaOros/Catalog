Rails.application.routes.draw do
  get 'userparams/show'

  get 'posts/index'

  devise_for :users
  root 'pages#index'
  resources :posts
  resources :userparams

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
