class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :user_stocks
  has_many :stocks, through: :user_stocks
  has_many :user_crypto
  has_many :cryptos, through: :user_crypto

  def stock_already_added?(ticker_symbol)
    stock = Stock.find_by_ticker(ticker_symbol)
    return false unless stock
    user_stocks.where(stock_id: stock.id).exists?
  end

  def crypto_already_added?(bitcurrency)
    crypto = Crypto.find_by_bitcurrency(bitcurrency)
    return false unless crypto
    user_crypto.where(crypto_id: cryptos.ids).exists?
  end

  def under_stock_limit?
    (user_stocks.count < 10)
  end

  def under_crypto_limit?
    (user_crypto.count < 10)
  end

  def can_add_stock?(ticker_symbol)
    under_stock_limit? && !stock_already_added?(ticker_symbol)
  end

  def can_add_crypto?(bitcurrency)
    under_crypto_limit? && !crypto_already_added?(bitcurrency)
  end
end
