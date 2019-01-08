require 'rails_helper'

describe 'the forecast endpoint' do
  it 'returns content json from objects' do
    VCR.use_cassette("forecast_endpoint_spec") do
      get "/api/v1/forecast?location=denver,co"

      expect(response.status).to eq 200
      result = JSON.parse(response.body, symbolize_names: true)
      attrib = result[:data][:attributes]

      expect(attrib).not_to be_empty
      expect(attrib.keys.include?(:summary)).to be(true)
      expect(attrib.keys.include?(:city_state)).to be(true)
      expect(attrib[:hourlies].count).to eq(8)
      expect(attrib[:dailies].count).to eq(5)
    end
  end

  it 'returns content json from new search' do
    VCR.use_cassette("austin_forecast_endpoint_spec") do
      get "/api/v1/forecast?location=austin,tx"

      expect(response.status).to eq 200
      result = JSON.parse(response.body, symbolize_names: true)
      attrib = result[:data][:attributes]

      expect(attrib).not_to be_empty
      expect(attrib.keys.include?(:summary)).to be(true)
      expect(attrib.keys.include?(:city_state)).to be(true)
      expect(attrib[:hourlies].count).to eq(8)
      expect(attrib[:dailies].count).to eq(5)
    end
  end


end
