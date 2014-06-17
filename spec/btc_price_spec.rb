require 'spec_helper'

module BtcPrice
  describe ".run" do
    describe "when external services are healthy" do
      before do
        ServicesHealth.any_instance.expects(:healthy?).returns(true)
        Price.expects(:current_price).returns(500)
      end

      it "returns a string containing a good health report and BTC price when services are available" do
        string = BtcPrice.run
        string.must_match(/Good/)
        string.must_match(/500/)
      end
    end

    describe "when external services are not healthy" do
      it "returns a string containing a bad health report when services aren't available" do
        ServicesHealth.any_instance.expects(:healthy?).returns(false)
        BtcPrice.run.must_match(/Bad/)
      end
    end
  end
end
