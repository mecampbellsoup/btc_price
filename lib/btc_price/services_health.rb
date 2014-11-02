module BtcPrice
  class ServicesHealth
    class CoinbaseApiError < StandardError ; end

    def healthy?
      # Check if Coinbase API is available
      begin
        response = CoinbaseGateway.new.send(:request_price)
      rescue OpenURI::HTTPError => error
        raise CoinbaseApiError, error.io
      end

      check_status(response)
    end

    private

    def check_status(response)
      # Inspect the response status
      response.status.first == "200"
    end
  end
end
