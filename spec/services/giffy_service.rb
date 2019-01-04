require 'rails_helper'

describe GiffyService do

	it "exists" do
    VCR.use_cassette("giffy_service_spec") do
		  summary = ["raining like cats and dogs"]

			service = GiffyService.new(summary)

			expect(service).to be_a(GiffyService)
      expect(service.url[0..21]).to eq("https://giphy.com/gifs")
		end
  end
end
