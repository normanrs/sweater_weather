require 'rails_helper'

describe 'the daily gif endpoint' do
  it 'returns content json from objects' do
    VCR.use_cassette("daily_gif_spec") do
      get "/api/v1/gifs?location=denver,co"

      expect(response.status).to eq 200
      result = JSON.parse(response.body, symbolize_names: true)
      expect(result[:data].count).to eq(5)
      expect(result[:data][0].class).to eq(Hash)
      expect(result[:data][0].count).to eq(3)

    end
  end
end
