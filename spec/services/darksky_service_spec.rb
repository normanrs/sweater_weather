require 'rails_helper'

describe DarkskyService do

	it "exists" do
		  coordinates = [39.7392, -104.9903]

			service = DarkskyService.new(coordinates)

			expect(service).to be_a(DarkskyService)
  end
end
