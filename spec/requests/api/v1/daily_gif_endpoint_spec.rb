require 'rails_helper'

describe 'the daily gif endpoint' do
  it 'returns content json from objects' do
    VCR.use_cassette("daily_gif_spec") do
      get "/api/v1/gifs?location=denver,co"

      expect(response.status).to eq 200
      result = JSON.parse(response.body, symbolize_names: true)
      expect(result[:data][:daily_forecast.count]).to eq(8)
      expect(result[:data][:daily_forecast[0.class]]).to eq(Hash)
      expect(result[:data][:daily_forecast[0.count]]).to eq(3)

    end
  end
end
