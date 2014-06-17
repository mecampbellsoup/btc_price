current_path = File.expand_path("../", __FILE__)
Dir[File.join(current_path, "btc_price/**/*.rb")].each { |f| require f }

module BtcPrice
  class << self
    def run
      "External services status: #{(ServicesHealth.new.healthy? ? 'Good.' : 'Bad.')}"\
      "\nCurrent BTC price: $#{sprintf("%.2f", Price.current_price)}."
    end
  end
end
