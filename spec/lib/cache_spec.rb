require 'spec_helper'

module BtcPrice
  class MockCoinbaseGateway
    attr_reader :fetch_counter

    def initialize
      @fetch_counter = 0
    end

    def current_price
      @fetch_counter += 1
      500
    end
  end

  describe Cache do
    before do
      $cache = $cache.clone
      @gateway = MockCoinbaseGateway.new
      @cache = Cache.new(@gateway)
      begin
        @cache.clear
      rescue Memcached::NotFound
      end
    end

    after do
      @cache.clear
    end

    it "hits the external service when the cache is 'cold'" do
      # stub API call; check return value of fetch, i.e. that it equals the stubbed API call
      @cache.current_price.must_equal 500  
      # now the 3rd party API gets hit
    end

    it "does not hit the external service when the cache is 'warm'" do
      @cache.current_price.must_equal 500
      @cache.current_price.must_equal 500
      @gateway.fetch_counter.must_equal 1
    end
  end
end
