require 'open-uri'
require 'json'

module BtcPrice
  class CoinbaseGateway
    def current_price
      JSON(read_request_price)['subtotal']['amount'].to_f
    end

    private

    def request_price
      open('https://coinbase.com/api/v1/prices/sell')
    end

    def read_request_price
      request_price.read
    end
  end
end
