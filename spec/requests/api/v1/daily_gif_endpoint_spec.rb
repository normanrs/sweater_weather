require 'rails_helper'

describe 'the daily gif endpoint' do
  it 'returns content json from objects' do
    VCR.use_cassette("daily_gif_spec") do
      get "/api/v1/gifs?location=denver,co"

      expect(response.status).to eq 200
      result = JSON.parse(response.body, symbolize_names: true)
      expect(result[:data][0].class).to eq(Hash)
      attrib = result[:data][0][:attributes]
      expect(attrib.count).to eq(4)
      expect(attrib[:url][0..21]).to eq("https://giphy.com/gifs")
      expect(attrib.keys.include?(:time)).to be(true)
      expect(attrib.keys.include?(:summary)).to be(true)
      expect(attrib.keys.include?(:url)).to be(true)
      expect(attrib.keys.include?(:copyright)).to be(true)
    end
  end
end
