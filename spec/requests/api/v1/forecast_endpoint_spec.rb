require 'rails_helper'

describe 'the forecast endpoint' do
  it 'returns content json from objects' do
    VCR.use_cassette("forecast_endpoint_spec") do
      get "/api/v1/forecast?location=denver,co"

      expect(response.status).to eq 200
      result = JSON.parse(response.body, symbolize_names: true)
      expect(result[:data][:attributes]).not_to be_empty
      expect(result[:data][:attributes].keys.include?(:summary)).to be(true)
      expect(result[:data][:attributes].keys.include?(:city_state)).to be(true)
      expect(result[:data][:attributes][:hourlies].count).to eq(8)
      expect(result[:data][:attributes][:dailies].count).to eq(5)
    end
  end

  it 'returns content json from new search' do
    VCR.use_cassette("austin_forecast_endpoint_spec") do
      get "/api/v1/forecast?location=austin,tx"

      expect(response.status).to eq 200
      result = JSON.parse(response.body, symbolize_names: true)
      expect(result[:data][:attributes]).not_to be_empty
      expect(result[:data][:attributes].keys.include?(:summary)).to be(true)
      expect(result[:data][:attributes].keys.include?(:city_state)).to be(true)
      expect(result[:data][:attributes][:hourlies].count).to eq(8)
      expect(result[:data][:attributes][:dailies].count).to eq(5)
    end
  end


end
