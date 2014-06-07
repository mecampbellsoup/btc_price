module BtcPrice
  class Runner
    def self.run
      "External services status: #{(ServicesHealth.new.healthy? ? 'Good.' : 'Bad.')}"\
      "\nCurrent BTC price: $#{sprintf("%.2f", Price.current_price)}."
    end
  end
end
