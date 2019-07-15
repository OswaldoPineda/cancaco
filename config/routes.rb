require 'sidekiq/web'
Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # routes for devise
  devise_for :users, controllers: { registrations: 'registrations' }

  devise_scope :user do
    get 'confirmations', to: 'confirmations#registration'
  end

  # Sidekiq
  mount Sidekiq::Web => '/sidekiq'

  # Root path
  root to: 'home#index'

  get '/users/account_options', to: 'account#index'
  get '/purchases', to: 'buy#index'
  get '/category/:id', to: 'subcategories#index'
end
