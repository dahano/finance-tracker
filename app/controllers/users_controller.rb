class UsersController < ApplicationController
  def my_portfolio
    @user = current_user
    @user_stocks = current_user.stocks
    @user_cryptos = current_user.cryptos
  end

  def my_friends
    @friendships = current_user.friends
  end

  def search
    if params[:search_param].blank?
      flash.now[:danger] = 'You entered, an empty string '
    else
      @users = User.search(params[:search_param])
      flash.now[:danger] = 'You have entered a non-existing user' if @users.blank?
    end
    respond_to do |format|
      format.js { render partial: 'friends/result' }
    end
  end
end
