require 'rails_helper'

describe BingService do

	it "exists", :vcr do

      address = "Denver, Co"

			service = BingService.new(address)

			expect(service).to be_a(BingService)

  end
end
