module BtcPrice
  class Price
    def self.adapter
      @adapter ||= Cache.new(CoinbaseGateway.new)
    end

    def self.adapter=(new_adapter)
      @adapter = new_adapter
    end

    def self.current_price
      adapter.current_price
    end
  end
end
