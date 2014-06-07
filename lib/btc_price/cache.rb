require 'memcached'

$cache = Memcached.new("localhost:11211")

module BtcPrice
  class Cache
    def initialize(backend)
      @backend = backend
    end

    def current_price
      begin
        read
      rescue Memcached::NotFound
        write
      end
    end

    def clear
      $cache.delete 'price'
    end

    private

    def read
      $cache.get 'price'
    end

    def write
      price = @backend.current_price
      $cache.set 'price', price
      price
    end
  end
end
