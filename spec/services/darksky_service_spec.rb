require 'rails_helper'

describe DarkskyService do

	it "exists" do
	  coordinates = [39.7392, -104.9903]

		service = DarkskyService.new(coordinates)

		expect(service).to be_a(DarkskyService)
  end

	it "returns weather data" do
	  coordinates = [39.7392, -104.9903]

		service = DarkskyService.new(coordinates)
		result = service.get_forecast
		current = result[:currently]
		minute = result[:minutely]
		hour = result[:hourly]
		expect(current.keys.include?(:time)).to be(true)
		expect(current.keys.include?(:temperature)).to be(true)
		expect(current.keys.include?(:humidity)).to be(true)
		expect(minute.keys.include?(:summary)).to be(true)
		expect(minute.keys.include?(:data)).to be(true)
		expect(hour.keys.include?(:summary)).to be(true)
		expect(hour.keys.include?(:data)).to be(true)

  end

end
