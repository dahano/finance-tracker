class StocksController < ApplicationController

  def search
    if params[:stock].present?
      @stock = Stock.new_from_lookup(params[:stock])
      if @stock
        respond_to do |format|
          format.js { render partial: 'users/result' }
        end
      else
        flash[:danger] = 'You have entered a non-existing symbol'
        redirect_to my_portfolio_url
      end
    else
      flash[:danger] = 'You entered, an empty string'
      redirect_to my_portfolio_url
    end
  end

end
