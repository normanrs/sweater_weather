require 'rails_helper'

describe BingService do

	it "exists" do
    VCR.use_cassette("bing_service_spec") do
      address = "Denver, Co"

			service = BingService.new(address)

			expect(service).to be_a(BingService)
		end
  end
end
