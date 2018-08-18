Rails.application.routes.draw do
  devise_for :users, :controllers => { :registrations => 'user/registrations' }

  get '/my-portfolio', to: 'users#my_portfolio'
  get 'search_stocks', to: 'stocks#search'
  get 'search_crypto', to: 'cryptos#search'
  get 'my_friends', to: 'users#my_friends'
  get 'search_friends', to: 'users#search'
  resources :friendships

  root 'welcome#index'
  resources :user_stocks, only: [:create, :destroy]
  resources :users, only: [:show]
  resources :user_cryptos, only: [:create, :destroy]
end
