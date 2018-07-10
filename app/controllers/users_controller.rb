class UsersController < ApplicationController
  def my_portfolio
    @user = current_user
    @user_stocks = current_user.stocks
    @user_cryptos = current_user.cryptos
  end
end
