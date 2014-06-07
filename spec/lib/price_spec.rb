require 'spec_helper'
require 'ostruct'

module BtcPrice
  describe Price do
    before do
      Price.adapter = OpenStruct.new(current_price: 492)
    end

    it "returns the current BTC price" do
      Price.current_price.must_equal 492
    end
  end
end
