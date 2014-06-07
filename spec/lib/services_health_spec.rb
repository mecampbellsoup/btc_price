require 'spec_helper'

module BtcPrice
  describe ServicesHealth do
    describe "#healthy?" do
      describe "when services are not healthy" do
        it "raises an exception when a server error is encountered" do
          error = OpenURI::HTTPError.new(503, "Service Unavailable")
          CoinbaseGateway.any_instance.expects(:request_price).raises error
          err = -> { ServicesHealth.new.healthy? }.must_raise ServicesHealth::CoinbaseApiError 
          err.message.must_match(/Service Unavailable/)
        end

        it "returns false when status code is not 200/OK" do
          response = stub(status: ["400", "Bad Request"])
          CoinbaseGateway.any_instance.expects(:request_price).returns(response)
          ServicesHealth.new.healthy?.must_equal false
        end
      end

      describe "when response status is 200" do
        it "returns true" do
          response = stub(status: ["200", "OK"])
          CoinbaseGateway.any_instance.expects(:request_price).returns(response)
          ServicesHealth.new.healthy?.must_equal true
        end
      end
    end
  end
end
