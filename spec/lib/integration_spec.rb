require 'spec_helper'

describe "./bin/btc_price" do
  it "prints price" do
    `./bin/btc_price`.to_i.must_be_close_to(500, 5000)
  end
end
