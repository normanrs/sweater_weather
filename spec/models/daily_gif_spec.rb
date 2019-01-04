require 'rails_helper'

RSpec.describe Daily, type: :model do
  it 'exists' do
    hash_in = {:time=>1546585200,
               :summary=>"Partly cloudy overnight.",
               :icon=>"partly-cloudy-night",
               :sunriseTime=>1546611746,
               :sunsetTime=>1546645782,
               :moonPhase=>0.96,
               :precipIntensity=>0,
               :precipIntensityMax=>0,
               :precipProbability=>0,
               :temperatureHigh=>57.31,
               :temperatureHighTime=>1546635600,
               :temperatureLow=>25.46,
               :temperatureLowTime=>1546696800,
               :apparentTemperatureHigh=>57.31,
               :apparentTemperatureHighTime=>1546635600,
               :apparentTemperatureLow=>18.65,
               :apparentTemperatureLowTime=>1546696800,
               :dewPoint=>20.78,
               :humidity=>0.44,
               :pressure=>1014.2,
               :windSpeed=>2.47,
               :windGust=>10.61,
               :windGustTime=>1546592400,
               :windBearing=>190,
               :cloudCover=>0.1,
               :uvIndex=>2,
               :uvIndexTime=>1546624800,
               :visibility=>10,
               :ozone=>264.68,
               :temperatureMin=>31.95,
               :temperatureMinTime=>1546610400,
               :temperatureMax=>57.31,
               :temperatureMaxTime=>1546635600,
               :apparentTemperatureMin=>29.47,
               :apparentTemperatureMinTime=>1546668000,
               :apparentTemperatureMax=>57.31,
               :apparentTemperatureMaxTime=>1546635600}

    daily = Daily.new(hash_in)

    expect(daily).to be_a(Daily)

  end
end
