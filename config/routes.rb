Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # routes for devise
  devise_for :users

  # Root path
  root to: 'home#index'

  get '/users/account_options', to: 'account#index'
end
