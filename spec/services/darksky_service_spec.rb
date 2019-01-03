require 'rails_helper'

describe DarkskyService do

	it "exists" do
    VCR.use_cassette("darksky_service_spec") do
		coordinates = [39.7392, -104.9903]

			service = DarkskyService.new(coordinates)

			expect(service).to be_a(DarkskyService)
		end
  end
end
