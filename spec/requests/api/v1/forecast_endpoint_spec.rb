require 'rails_helper'

describe 'the forecast endpoint' do
  it 'returns content json from objects' do
    VCR.use_cassette("forecast_endpoint_spec") do
      get "/api/v1/forecast?location=denver,co"

      expect(response.status).to eq 200
      result = JSON.parse(response.body, symbolize_names: true)
      expect(result[:data][:attributes]).not_to be_empty
    end
  end
end
