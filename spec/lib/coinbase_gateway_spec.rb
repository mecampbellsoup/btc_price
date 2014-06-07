require 'spec_helper'

module BtcPrice
  class TestCoinbaseGateway < CoinbaseGateway
    def read_request_price
      "{\"subtotal\":{\"amount\":\"511.03\",\"currency\":\"USD\"},\"fees\":[{\"coinbase\":{\"amount\":\"5.11\",\"currency\":\"USD\"}},{\"bank\":{\"amount\":\"0.15\",\"currency\":\"USD\"}}],\"total\":{\"amount\":\"505.77\",\"currency\":\"USD\"},\"amount\":\"505.77\",\"currency\":\"USD\"}"
    end
  end

  describe CoinbaseGateway do
    it "returns the current BTC price" do
      gateway = TestCoinbaseGateway.new
      gateway.current_price.must_equal 511.03
    end
  end
end
