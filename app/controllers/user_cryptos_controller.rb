class UserCryptosController < ApplicationController

  def create
    crypto = Crypto.new_from_lookup(params[:bitcurrency])
    crypto.save
    crypto = Crypto.find_by_bitcurrency(params[:bitcurrency])
    if crypto.blank?
      crypto = Crypto.new_from_lookup(params[:bitcurrency])
      crypto.save
    end
    @user_crypto = UserCrypto.create(user: current_user, crypto: crypto)
    flash[:success] = "#{@user_crypto.crypto.bitcurrency} currency was added to your portfolio"
    redirect_to my_portfolio_url
  end

  def destroy
    crypto = Crypto.find(params[:id])
    @user_crypto = UserCrypto.where(user_id: current_user.id, crypto: crypto.id).first
    @user_crypto.destroy
    flash[:notice] = 'Crypto was successfully removed from your portfolio!'
    redirect_to my_portfolio_url
  end
end
