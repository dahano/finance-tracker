Rails.application.routes.draw do
  devise_for :users
  root 'welcome#index'
  get '/my-portfolio', to: 'users#my_portfolio'
  get 'search_stocks', to: 'stocks#search'
  get 'search_crypto', to: 'cryptos#search'
  resources :user_stocks, only: [:create]
  resources :user_cryptos, only: [:create]
end
