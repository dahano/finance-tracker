class CryptosController < ApplicationController
  def search
    if params[:crypto].present?
      @crypto = Crypto.new_from_lookup(params[:crypto])
      if @crypto
        render 'users/my_portfolio'
      else
        flash[:danger] = 'sorry we dont support that currency'
        redirect_to my_portfolio_url
      end
    else
      flash[:danger] = 'You must enter something!'
      redirect_to my_portfolio_url
    end
  end
end
