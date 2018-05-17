class CryptosController < ApplicationController

  def search
    if params[:crypto].blank?
      flash.now[:danger] = 'You must enter something!'
    else
      @crypto = Crypto.new_from_lookup(params[:crypto])
      flash.now[:danger] = 'sorry we dont support that currency' unless @crypto
    end
    respond_to do |format|
      format.js { render partial: 'users/result' }
    end
  end
end
