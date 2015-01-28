Rails.application.routes.draw do
  devise_for :users

  post '/add_user', to: 'home#add_user'

  root 'home#index'
end
