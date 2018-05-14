class Crypto < ApplicationRecord
  def self.new_from_lookup(bitcurrency)
    @exchange = Coinmarketcap.coin(bitcurrency)
    body = JSON.parse(@exchange.body)
    bit_currency = body[0]['name']
    price_usd = body[0]['price_usd']
    currency = 'usd'
    new(currency: currency, bitcurrency: bit_currency, last: price_usd )
  rescue Exception => e
    return nil
  end
end
