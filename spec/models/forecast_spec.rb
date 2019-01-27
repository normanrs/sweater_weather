require 'rails_helper'

RSpec.describe Forecast, type: :model do
  it 'exists' do
    location = 'denver,co'
    forecast = Forecast.new(location)
    expect(forecast).to be_a(Forecast)
    require "pry"; binding.pry
  end
end
