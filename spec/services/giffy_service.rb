require 'rails_helper'

describe GiffyService do

	it "exists" do
		  summary = "raining like cats and dogs"

			service = GiffyService.new(summary)

			expect(service).to be_a(GiffyService)
      expect(service.url[0..21]).to eq("https://giphy.com/embe")
  end

	it "cleands text" do
		  summary = "Sky is clear, calm."

			service = GiffyService.new(summary)

			expect(service).to be_a(GiffyService)
      expect(service.url[0..21]).to eq("https://giphy.com/embe")
  end

	it "speeds API calls with memoization" do
		  summary = "Sky is clear, calm."

			call_1 = Benchmark.measure {@call = GiffyService.new(summary)}
			call_2 = Benchmark.measure {@call.get_json(summary)  }

			expect(call_1.real).to be > call_2.real
  end

end
