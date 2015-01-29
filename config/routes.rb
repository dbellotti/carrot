Rails.application.routes.draw do
  devise_for :users

  post '/add_user', to: 'home#add_user'
  get  '/send_carrot', to: 'home#send_carrot'

  root 'home#index'
end
