require 'rails_helper'

describe GiffyService do

	it "exists" do
		  summary = ["raining like cats and dogs"]

			service = GiffyService.new(summary)

			expect(service).to be_a(GiffyService)
      expect(service.url[0..21]).to eq("https://giphy.com/gifs")
  end
end
